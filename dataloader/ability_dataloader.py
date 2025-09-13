import json
import csv
import os

def convert_abilities_to_csv(json_path, csv_path):
    with open(json_path, 'r') as f:
        abilities = json.load(f)

    fieldnames = [
        'name', 'dex_num', 'description', 'blocked_by_neut_gas', 'ignored'
    ]

    rows = []
    for key, ability in abilities.items():
        name = ability.get('name')
        dex_num = ability.get('num')
        short_description = ability.get('shortDesc', '').replace('\n', ' ').strip()
        blocked_by_neut_gas = int('cantsuppress' in ability.get('flags', {}))

        row = {
            'name': name,
            'dex_num': dex_num,
            'description': short_description,
            'blocked_by_neut_gas': blocked_by_neut_gas,
            'ignored': 0  # Placeholder for future use
        }
        rows.append(row)

    with open(csv_path, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)

if __name__ == "__main__":
	json_path = os.path.join(os.path.dirname(__file__), 'showdown_jsons', 'abilities.json')
	csv_path = os.path.join(os.path.dirname(__file__), 'abilities.csv')
	convert_abilities_to_csv(json_path, csv_path)