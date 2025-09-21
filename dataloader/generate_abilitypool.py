#!/usr/bin/env python3
"""
Generate abilitypool_dataloader.csv from pokedex.json and the supabase CSVs.

Output columns: pokemon_id,ability_id,is_hidden_ability

This script is tolerant of name mismatches: it normalizes names by lowercasing and removing
non-alphanumeric characters when matching. Unmatched entries are printed to stderr for review.
"""
import csv
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
POKEDEX = ROOT / 'showdown_jsons' / 'pokedex.json'
POKEMON_CSV = ROOT / 'supabase_csvs' / 'pokemon_rows.csv'
ABILITIES_CSV = ROOT / 'supabase_csvs' / 'abilities_rows.csv'
OUT_CSV = ROOT / 'abilitypool.csv'


def normalize(s):
    if s is None:
        return ''
    # Lowercase, remove non-alphanumeric
    return re.sub(r'[^a-z0-9]', '', s.lower())


def load_csv_id_map(csv_path, name_col='name'):
    """Return dict mapping normalized name -> id and also a dict of original names for diagnostics."""
    mapping = {}
    originals = {}
    with csv_path.open(newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            name = row.get(name_col) or ''
            nid = row.get('id') or row.get('Id') or row.get('ID')
            if not nid:
                continue
            key = normalize(name)
            # Keep first seen
            if key not in mapping:
                mapping[key] = nid
                originals[key] = name
    return mapping, originals


def main():
    if not POKEDEX.exists():
        print(f"pokedex.json not found at {POKEDEX}", file=sys.stderr)
        sys.exit(2)

    pokemon_map, pokemon_originals = load_csv_id_map(POKEMON_CSV)
    ability_map, ability_originals = load_csv_id_map(ABILITIES_CSV)

    with POKEDEX.open(encoding='utf-8') as f:
        pokedex = json.load(f)

    rows = []
    unmatched_pokemon = set()
    unmatched_abilities = set()

    for key, data in pokedex.items():
        # The JSON key is already the compact form (spaces/symbols removed). However, some rows
        # in pokemon_rows.csv may have different forms (like alternate forms). We'll try several
        # matching strategies: key, data['name'], data.get('baseSpecies') + form, and name without punctuation.
        candidates = []
        candidates.append(key)
        name = data.get('name')
        if name:
            candidates.append(name)
        base = data.get('baseSpecies')
        forme = data.get('forme')
        if base and forme:
            candidates.append(f"{base}-{forme}")
            candidates.append(f"{base}{forme}")

        pokemon_id = None
        for c in candidates:
            nid = pokemon_map.get(normalize(c))
            if nid:
                pokemon_id = nid
                break

        if not pokemon_id:
            unmatched_pokemon.add(key)
            continue

        abilities = data.get('abilities') or {}
        for k, ability_name in abilities.items():
            if ability_name is None:
                continue
            ability_id = ability_map.get(normalize(ability_name))
            if not ability_id:
                # try stripping parentheses or text after a space (e.g., 'Levitate (No Guard)')
                alt = re.sub(r"\(.*\)", "", ability_name).strip()
                ability_id = ability_map.get(normalize(alt))
            if not ability_id:
                unmatched_abilities.add(ability_name)
                continue

            is_hidden = 1 if k.upper() == 'H' else 0
            rows.append((pokemon_id, ability_id, str(is_hidden)))

    # Write CSV
    with OUT_CSV.open('w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['pokemon_id', 'ability_id', 'is_hidden_ability'])
        for r in rows:
            writer.writerow(r)

    print(f"Wrote {len(rows)} ability mappings to {OUT_CSV}")
    if unmatched_pokemon:
        print(f"Warning: {len(unmatched_pokemon)} pokedex entries had no matching pokemon_rows.csv id. Example: {list(unmatched_pokemon)[:5]}", file=sys.stderr)
    if unmatched_abilities:
        print(f"Warning: {len(unmatched_abilities)} unique abilities were unmatched in abilities_rows.csv. Example: {list(unmatched_abilities)[:10]}", file=sys.stderr)


if __name__ == '__main__':
    main()
