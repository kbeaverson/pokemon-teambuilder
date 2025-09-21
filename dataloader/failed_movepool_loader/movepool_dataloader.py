import csv
import json
import os
import re
import time
import argparse
from typing import Dict, List, Tuple

import requests
from bs4 import BeautifulSoup

CSV_DIR = os.path.join(os.path.dirname(__file__), 'supabase_csvs')
POKEMON_CSV = os.path.join(os.path.dirname(__file__), 'supabase_csvs', 'pokemon_rows.csv')
MOVES_CSV = os.path.join(os.path.dirname(__file__), 'supabase_csvs', 'moves_rows.csv')


def read_csv_map(path: str, key_field: str) -> Dict[str, Dict[str, str]]:
    """Read CSV and return a map by lowercased name to row dict."""
    m = {}
    with open(path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Use name as primary key; store lowercased and stripped
            name = (row.get('name') or '').strip().lower()
            if name:
                m[name] = row
    return m


def format_name_for_serebii(name: str) -> str:
    # Remove spaces and periods, lowercase. Keep dashes (e.g., 'Charizard-Mega-Y') as-is except spaces
    return re.sub(r'[\s.\'\"]', '', name).lower()


def scrape_serebii_for_pokemon(pokemon_name: str, dex_num: str = None) -> Dict[str, List[Tuple[str, str]]]:
    """Try gen9 -> gen8 -> gen7 and return dict with keys 'levelup','tm','egg' mapping to list of (move_name, level_or_flag).

    level_or_flag: for levelup moves this is the level (string), for TM/Egg it's ''. Special mappings: '-' -> '1', 'evolve' -> '-2'.
    """
    formatted = format_name_for_serebii(pokemon_name)

    gens = [
        ('sv', f'https://www.serebii.net/pokedex-sv/{formatted}/', 'sv'),
        ('swsh', f'https://www.serebii.net/pokedex-swsh/{formatted}/', 'swsh'),
    ]
    if dex_num:
        dex3 = str(dex_num).zfill(3)
        gens.append(('sm', f'https://www.serebii.net/pokedex-sm/{dex3}.shtml', 'sm'))
    else:
        gens.append(('sm', None, 'sm'))

    headers = {'User-Agent': 'movepool-scraper/1.0 (+https://github.com/)'}
    for gen_key, url, gen in gens:
        if not url:
            continue
        try:
            resp = requests.get(url, headers=headers, timeout=20)
        except Exception:
            continue
        if resp.status_code != 200:
            continue

        soup = BeautifulSoup(resp.text, 'html.parser')

        # We'll collect moves from tables with particular headings
        results = {'levelup': [], 'tm': [], 'egg': []}

        # Find all tables and their preceding header/title text. Use an explicit classification priority
        def get_table_heading(t):
            # Prefer caption
            if t.caption and t.caption.get_text().strip():
                return t.caption.get_text(separator=' ').strip()
            # Look backward for nearby header-like tags (limit search to avoid grabbing unrelated headers)
            for prev in t.find_all_previous():
                if getattr(prev, 'name', None) in ('h1', 'h2', 'h3', 'b', 'strong', 'font'):
                    text = prev.get_text(separator=' ').strip()
                    if text:
                        return text
                # stop if we hit a new table - heuristics to keep nearby only
                if getattr(prev, 'name', None) == 'table':
                    break
            return ''

        def classify_heading(text: str) -> str:
            # Priority: levelup -> tm/tutor -> egg
            low = text.lower()
            if any(k in low for k in ('standard level up', 'ultra sun/ultra moon level up')):
                return 'levelup'
            if any(k in low for k in ('technical machine attacks', 'tm & hm attacks', 'technical record attacks', 'isle of armor move tutor attacks', 'move tutor attacks', 'ultra sun/ultra moon move tutor attacks')):
                return 'tm'
            if 'egg moves' in low:
                return 'egg'
            if 'pre-evolution only moves' in low:
                return 'pre_evo'
            return ''

        for table in soup.find_all('table'):
            heading = get_table_heading(table)
            if not heading:
                continue
            caption_low = heading.lower()
            category = classify_heading(heading)

            # Parse rows in the table
            for tr in table.find_all('tr'):
                tds = tr.find_all(['td', 'th'])
                if len(tds) < 1:
                    continue
                # Find anchor within row for move name.
                # TM tables often have a first anchor linking to the TM page (e.g. TM01)
                # and the move name is in a subsequent column. Prefer anchors whose href contains 'attackdex'.
                anchors = tr.find_all('a', href=True)
                a = None
                for cand in anchors:
                    href = cand['href']
                    if 'attackdex' in href:
                        a = cand
                        break
                if not a and anchors:
                    # fallback to first anchor if no attackdex anchor found
                    a = anchors[0]
                if not a:
                    continue
                move_name = a.get_text().strip()

                # Level information may be in first/second column depending on table
                level = ''
                if category == 'levelup':
                    # Level is always in the first column for levelup moves
                    level = tds[0].get_text().strip()
                # Normalize special level tokens
                if level == '-':
                    level = '1'
                elif level.lower() == 'evolve':
                    level = '-2'

                if category == 'pre_evo':
                    results['levelup'].append((move_name, '0'))
                elif category == 'levelup':
                    results['levelup'].append((move_name, level or '1'))
                elif category == 'egg':
                    results['egg'].append((move_name, ''))
                elif category == 'tm':
                    results['tm'].append((move_name, ''))

        return results

    # If nothing found on any gen pages
    return {}


def normalize_move_name(move_name: str) -> str:
    return move_name.strip().lower()


def map_names_to_ids(pokemon_map: Dict[str, Dict[str, str]], moves_map: Dict[str, Dict[str, str]], scraped: Dict[str, List[Tuple[str, str]]]) -> Tuple[List[Dict], List[Dict]]:
    """Map scraped move names to UUIDs from csv maps. Return (matched_rows, unmatched_entries).

    matched_rows are dicts with keys: move_id, pokemon_id, is_egg_move, is_levelup_move, is_tm_move, levelup_level
    """
    matched = []
    unmatched = []

    for category, entries in scraped.items():
        # category here is per-pokemon result (we will call this per pokemon, so adapt outside)
        pass

    return matched, unmatched


def run_scrape(pokemon_csv: str = POKEMON_CSV, moves_csv: str = MOVES_CSV, sample: List[str] = None, delay: float = 1.0, output_csv: str = 'dataloader/movepools_scraped.csv'):
    pokemon_map = read_csv_map(pokemon_csv, 'name')
    moves_map = read_csv_map(moves_csv, 'name')

    # If sample provided, restrict to those names
    to_process = []
    if sample:
        for s in sample:
            key = s.strip().lower()
            if key in pokemon_map:
                to_process.append(pokemon_map[key])
            else:
                # try formatting variations
                for k, v in pokemon_map.items():
                    if k.startswith(key) or key in k:
                        to_process.append(v)
                        break
    else:
        to_process = list(pokemon_map.values())

    fieldnames = ['move_id', 'pokemon_id', 'is_egg_move', 'is_levelup_move', 'is_tm_move', 'levelup_level', 'move_name']
    matched_rows = []
    unmatched_report = []

    for idx, p in enumerate(to_process):
        name = p.get('name')
        dex = p.get('dex_num')
        print(f"[{idx+1}/{len(to_process)}] Scraping {name}...")
        scraped = scrape_serebii_for_pokemon(name, dex)
        if not scraped:
            print(f"  No pages found for {name}, skipping.")
            continue

        # scraped contains keys levelup/tm/egg lists
        for move_name, level in scraped.get('levelup', []):
            mkey = normalize_move_name(move_name)
            move_row = moves_map.get(mkey)
            if move_row:
                matched_rows.append({'move_id': move_row['id'], 'pokemon_id': p['id'], 'is_egg_move': 'false', 'is_levelup_move': 'true', 'is_tm_move': 'false', 'levelup_level': level or '', 'move_name': move_name})
            else:
                unmatched_report.append({'pokemon': name, 'move': move_name, 'category': 'levelup', 'level': level})

        for move_name, _ in scraped.get('tm', []):
            mkey = normalize_move_name(move_name)
            move_row = moves_map.get(mkey)
            if move_row:
                matched_rows.append({'move_id': move_row['id'], 'pokemon_id': p['id'], 'is_egg_move': 'false', 'is_levelup_move': 'false', 'is_tm_move': 'true', 'levelup_level': '', 'move_name': move_name})
            else:
                unmatched_report.append({'pokemon': name, 'move': move_name, 'category': 'tm'})

        for move_name, _ in scraped.get('egg', []):
            mkey = normalize_move_name(move_name)
            move_row = moves_map.get(mkey)
            if move_row:
                matched_rows.append({'move_id': move_row['id'], 'pokemon_id': p['id'], 'is_egg_move': 'true', 'is_levelup_move': 'false', 'is_tm_move': 'false', 'levelup_level': '', 'move_name': move_name})
            else:
                unmatched_report.append({'pokemon': name, 'move': move_name, 'category': 'egg'})

        time.sleep(delay)

    # Write outputs
    os.makedirs(os.path.dirname(output_csv), exist_ok=True)
    with open(output_csv, 'w', newline='', encoding='utf-8') as outf:
        writer = csv.DictWriter(outf, fieldnames=fieldnames)
        writer.writeheader()
        for r in matched_rows:
            writer.writerow(r)

    unmatched_path = os.path.join(os.path.dirname(output_csv), 'unmatched_moves.json')
    with open(unmatched_path, 'w', encoding='utf-8') as f:
        json.dump(unmatched_report, f, indent=2, ensure_ascii=False)

    print(f"Wrote {len(matched_rows)} matched rows to {output_csv}")
    print(f"Wrote {len(unmatched_report)} unmatched entries to {unmatched_path}")


def main():
    parser = argparse.ArgumentParser(description='Scrape Serebii movepools and map to CSV ids')
    parser.add_argument('--sample', nargs='+', help='Pokemon names to run as a sample (e.g. Pikachu)')
    parser.add_argument('--delay', type=float, default=1.0, help='Delay between requests in seconds')
    parser.add_argument('--output', default='dataloader/movepools_scraped.csv')
    args = parser.parse_args()

    run_scrape(sample=args.sample, delay=args.delay, output_csv=args.output)


if __name__ == '__main__':
    main()