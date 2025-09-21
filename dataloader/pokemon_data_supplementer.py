import csv
import json
import os

POKEMON_ROWS_PATH = os.path.join(os.path.dirname(__file__), 'supabase_csvs', 'pokemon_rows.csv')
POKEDEX_JSON_PATH = os.path.join(os.path.dirname(__file__), 'showdown_jsons', 'pokedex.json')
OUTPUT_PATH = os.path.join(os.path.dirname(__file__), 'supabase_csvs', 'pokemon_rows_supplemented.csv')

def load_name_to_id(csv_path):
	name_to_id = {}
	with open(csv_path, newline='', encoding='utf-8') as f:
		reader = csv.DictReader(f)
		for row in reader:
			name_to_id[row['name']] = row['id']
	return name_to_id

def load_pokedex_json(json_path):
	with open(json_path, encoding='utf-8') as f:
		return json.load(f)

def supplement_csv():
	name_to_id = load_name_to_id(POKEMON_ROWS_PATH)
	pokedex = load_pokedex_json(POKEDEX_JSON_PATH)

	# Map species name to pokedex entry
	pokedex_by_name = {entry['name']: entry for entry in pokedex.values() if 'name' in entry}

	with open(POKEMON_ROWS_PATH, newline='', encoding='utf-8') as f:
		reader = csv.DictReader(f)
		fieldnames = reader.fieldnames + ['base_species_id', 'prevo_id']
		rows = []
		for row in reader:
			name = row['name']
			base_species_id = ''
			prevo_id = ''
			pokedex_entry = pokedex_by_name.get(name)
			if pokedex_entry:
				base_species = pokedex_entry.get('baseSpecies')
				prevo = pokedex_entry.get('prevo')
				if base_species and base_species in name_to_id:
					base_species_id = name_to_id[base_species]
				if prevo and prevo in name_to_id:
					prevo_id = name_to_id[prevo]
			row['base_species_id'] = base_species_id
			row['prevo_id'] = prevo_id
			rows.append(row)

	with open(OUTPUT_PATH, 'w', newline='', encoding='utf-8') as f:
		writer = csv.DictWriter(f, fieldnames=fieldnames)
		writer.writeheader()
		writer.writerows(rows)

if __name__ == '__main__':
	supplement_csv()
