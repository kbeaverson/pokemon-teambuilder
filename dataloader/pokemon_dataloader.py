
import json
import csv
import os

def convert_pokedex_to_csv(json_path, csv_path):
	with open(json_path, 'r') as f:
		pokedex = json.load(f)

	fieldnames = [
		'name', 'dex_num', 'type', 'is_pre_evolution', 'weight', 'gender_ratio',
		'is_mythical', 'is_legendary', 'is_max', 'is_mega', 'mandatory_item_name', 'base_stats'
	]

	rows = []
	for key, poke in pokedex.items():
		name = poke.get('name')
		dex_num = poke.get('num')
		type_ = json.dumps(poke.get('types', []))
		# store as 0/1 to avoid CSV boolean string parsing issues downstream
		is_pre_evolution = int(bool(poke.get('evos')))
		weight = poke.get('weightkg')
		gender_ratio = poke.get('genderRatio', {}).get('M')
		if gender_ratio == "N":
			gender_ratio = -1
		# convert boolean-like flags to 0/1 for consistency
		is_mythical = int('Mythical' in poke.get('tags', []))
		is_legendary = int('Restricted Legendary' in poke.get('tags', []))
		is_max = int('gmax' in poke.get('forme', '').lower())
		is_mega = int('mega' in poke.get('forme', '').lower())
		mandatory_item_name = poke.get('requiredItem')
		base_stats = json.dumps(poke.get('baseStats', {}))

		row = {
			'name': name,
			'dex_num': dex_num,
			'type': type_,
			'is_pre_evolution': is_pre_evolution,
			'weight': weight,
			'gender_ratio': gender_ratio,
			'is_mythical': is_mythical,
			'is_legendary': is_legendary,
			'is_max': is_max,
			'is_mega': is_mega,
			'mandatory_item_name': mandatory_item_name,
			'base_stats': base_stats
		}
		rows.append(row)

	# post-generation sanity checks: known canonical values
	# map by name to expected is_pre_evolution (1 or 0)
	canonical_checks = {
		'Bulbasaur': 1,
		'Ivysaur': 1,
		'Venusaur': 0,
	}
	for r in rows:
		expected = canonical_checks.get(r['name'])
		if expected is not None and int(r['is_pre_evolution']) != expected:
			raise AssertionError(f"Sanity check failed for {r['name']}: got {r['is_pre_evolution']} expected {expected}")

	with open(csv_path, 'w', newline='') as csvfile:
		writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
		writer.writeheader()
		for row in rows:
			writer.writerow(row)

if __name__ == "__main__":
	json_path = os.path.join(os.path.dirname(__file__), 'showdown_jsons', 'pokedex.json')
	csv_path = os.path.join(os.path.dirname(__file__), 'pokemon.csv')
	convert_pokedex_to_csv(json_path, csv_path)

