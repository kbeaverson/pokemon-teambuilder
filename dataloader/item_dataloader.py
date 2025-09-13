import json
import csv
import os

def convert_items_to_csv(json_path, csv_path):
    with open(json_path, 'r') as f:
        items = json.load(f)

    fieldnames = [
        'name', 'dex_num', 'fling_power', 'ignored_by_klutz', 'category', 'description',
    ]

    # 'is_berry', 'is_choice_item', 'is_gem', 'is_plate', 'is_z_crystal'

    rows = []
    for key, item in items.items():
        name = item.get('name')
        dex_num = item.get('num')
        fling_power = item.get('fling', {}).get('basePower', 0)
        ignored_by_klutz = int(item.get('ignoreKlutz', False))
        attributes = []
        for attr in ['isBerry', 'isChoice', 'isGem', 'zMove']:
            if item.get(attr, False):
                attributes.append(attr)
        category = json.dumps(attributes)
        short_description = item.get('shortDesc', '').replace('\n', ' ').strip()

        row = {
            'name': name,
            'dex_num': dex_num,
            'fling_power': fling_power,
            'ignored_by_klutz': ignored_by_klutz,
            'category': category,
            'description': short_description,
        }
        rows.append(row)

    with open(csv_path, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)

if __name__ == "__main__":
	json_path = os.path.join(os.path.dirname(__file__), 'showdown_jsons', 'items.json')
	csv_path = os.path.join(os.path.dirname(__file__), 'items.csv')
	convert_items_to_csv(json_path, csv_path)