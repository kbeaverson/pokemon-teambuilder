#!/usr/bin/env python3
"""
Parse Showdown learnsets JSON and produce a movepool CSV that maps
pokemon_id -> move_id with flags for egg/tm/tutor/levelup and level.

Places output at: dataloader/supabase_csvs/movepool.csv

Matching strategy: normalize names by removing non-alphanumeric characters
and lowercasing. Prefer generation 9 if any gen9 entries exist for a
pokemon; otherwise prefer gen8; otherwise gen7. Ignore event (S) and
virtual console (V) entries. Handles multiple learn methods per move.
"""

import csv
import json
import os
import re
import sys
from collections import defaultdict


HERE = os.path.dirname(os.path.abspath(__file__))
SUPABASE_DIR = os.path.join(HERE, 'supabase_csvs')
POKEMON_CSV = os.path.join(SUPABASE_DIR, 'pokemon_rows_supplemented.csv')
MOVES_CSV = os.path.join(SUPABASE_DIR, 'moves_rows.csv')
LEARNSETS_JSON = os.path.join(HERE, 'showdown_jsons', 'learnsets.json')
OUT_CSV = os.path.join(SUPABASE_DIR, 'movepool.csv')


def normalize_key(s):
    if s is None:
        return ''
    s = s.lower()
    # keep only ascii letters and digits
    return re.sub(r'[^a-z0-9]', '', s)


def load_csv_map(path, name_field='name', id_field='id'):
    """Return map from normalized name -> id and a reverse mapping of raw names."""
    m = {}
    alt = defaultdict(list)
    if not os.path.exists(path):
        print(f"ERROR: CSV not found: {path}", file=sys.stderr)
        return m, alt
    with open(path, newline='', encoding='utf-8') as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            raw = row.get(name_field) or ''
            rid = row.get(id_field) or row.get('id') or ''
            key = normalize_key(raw)
            if key and rid:
                # prefer first occurrence
                if key not in m:
                    m[key] = rid
                alt[key].append((raw, rid))
    return m, alt


def choose_generation_for_pokemon(learnset_methods):
    # learnset_methods: iterable of method lists
    gens = set()
    for methods in learnset_methods:
        for m in methods:
            if not m:
                continue
            mstr = str(m)
            # method strings usually begin with generation digit
            if re.match(r'^9', mstr):
                gens.add(9)
            elif re.match(r'^8', mstr):
                gens.add(8)
            elif re.match(r'^7', mstr):
                gens.add(7)
    if 9 in gens:
        return 9
    if 8 in gens:
        return 8
    if 7 in gens:
        return 7
    return None


def parse_method(method):
    # parse something like '9M', '8L12', '7E', '8T', '9S' etc.
    m = str(method)
    m = m.strip()
    m = m.replace('(', '').replace(')', '')
    mo = re.match(r'^(\d+)([A-Za-z])(\d*)', m)
    if not mo:
        return None
    gen = int(mo.group(1))
    letter = mo.group(2).upper()
    level = mo.group(3)
    level = int(level) if level.isdigit() else None
    return gen, letter, level


def main():
    poke_map, poke_alt = load_csv_map(POKEMON_CSV, name_field='name', id_field='id')
    move_map, move_alt = load_csv_map(MOVES_CSV, name_field='name', id_field='id')

    if not os.path.exists(LEARNSETS_JSON):
        print(f"ERROR: learnsets JSON not found: {LEARNSETS_JSON}", file=sys.stderr)
        sys.exit(1)

    with open(LEARNSETS_JSON, encoding='utf-8') as fh:
        data = json.load(fh)

    rows = []
    missing_pokemon = set()
    missing_moves = set()

    for poke_key, poke_data in data.items():
        learnset = poke_data.get('learnset') or {}
        if not learnset:
            continue

        # Determine generation preference for this pokemon
        chosen_gen = choose_generation_for_pokemon(learnset.values())
        if chosen_gen is None:
            # nothing in gens 7-9; skip
            continue

        # find pokemon id: try normalized key
        pid = poke_map.get(normalize_key(poke_key))
        if not pid:
            # try variants - try title-case and hyphen
            pid = poke_map.get(normalize_key(poke_key.replace('-', '')))
        if not pid:
            # try matching by any alternate entries containing the key as substring
            # fallback: attempt to find by more fuzzy matching in poke_alt
            for k, vals in poke_alt.items():
                if normalize_key(poke_key) == k:
                    pid = vals[0][1]
                    break
        if not pid:
            missing_pokemon.add(poke_key)
            continue

        for move_name, methods in learnset.items():
            # filter methods to chosen generation
            filtered = [m for m in methods if str(m).startswith(str(chosen_gen))]
            if not filtered:
                # no methods for chosen generation -> skip move
                continue

            # resolve move id
            mid = move_map.get(normalize_key(move_name))
            if not mid:
                # try with spaces/hyphens removed etc
                mid = move_map.get(normalize_key(move_name.replace('-', '')))
            if not mid:
                missing_moves.add(move_name)
                continue

            is_egg = 0
            is_tm = 0
            is_tutor = 0
            is_level = 0
            level_val = None

            for m in filtered:
                parsed = parse_method(m)
                if not parsed:
                    continue
                gen, letter, lvl = parsed
                # Ignore event S and virtual console V
                if letter == 'S' or letter == 'V':
                    continue
                if letter == 'E':
                    is_egg = 1
                elif letter == 'M':
                    is_tm = 1
                elif letter == 'T':
                    # tutor available in gens 7-8 (and possibly others); handle generically
                    is_tutor = 1
                elif letter == 'L':
                    is_level = 1
                    if lvl is not None:
                        if level_val is None:
                            level_val = lvl
                        else:
                            level_val = min(level_val, lvl)

            if not (is_egg or is_tm or is_tutor or is_level):
                # nothing saved for this move (e.g., only S/V entries) -> skip
                continue

            rows.append({
                'pokemon_id': pid,
                'move_id': mid,
                'is_egg_move': str(is_egg),
                'is_tm_move': str(is_tm),
                'is_tutor_move': str(is_tutor),
                'is_levelup_move': str(is_level),
                'levelup_level': '' if level_val is None else str(level_val),
            })

    # write CSV
    fieldnames = ['pokemon_id', 'move_id', 'is_egg_move', 'is_tm_move', 'is_tutor_move', 'is_levelup_move', 'levelup_level']
    os.makedirs(os.path.dirname(OUT_CSV), exist_ok=True)
    with open(OUT_CSV, 'w', newline='', encoding='utf-8') as out:
        writer = csv.DictWriter(out, fieldnames=fieldnames)
        writer.writeheader()
        for r in rows:
            writer.writerow(r)

    # summary
    print(f"Wrote {len(rows)} movepool rows to: {OUT_CSV}")
    if missing_pokemon:
        print(f"Missing pokemon matches for {len(missing_pokemon)} names: {list(missing_pokemon)}", file=sys.stderr)
    if missing_moves:
        print(f"Missing move matches for {len(missing_moves)} moves: {list(missing_moves)}", file=sys.stderr)


if __name__ == '__main__':
    main()
