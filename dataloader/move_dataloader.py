import json
import csv
import os

def convert_moves_to_csv(json_path, csv_path):
    with open(json_path, 'r') as f:
        moves_data = json.load(f)

    fieldnames = [
        'name', 'type', 'dex_num', 'category', 'target', 'power', 'accuracy',
        'priority', 'pp', 'short_description', 'long_description', 'has_secondary_effect',
        'is_multi_hit', 'multi_hit_high', 'multi_hit_low', 'ignores_substitute',
        'ignores_protect', 'bounceable', 'bite', 'bullet', 'contact', 'dance', 'heal',
        'powder', 'pulse', 'punch', 'slice', 'sound', 'wind', 'boosted_by_sheer_force',
        'ohko', 'is_z_move', 'is_max_move', 'is_legal'
    ]

    rows = []
    for key, move in moves_data.items():
        name = move.get('name')
        type_ = json.dumps(move.get('type', []))
        dex_num = move.get('num')
        category = move.get('category')
        target = move.get('target')
        power = move.get('basePower', 0) or 0
        accuracy = move.get('accuracy', None)
        # Normalize accuracy values. In JSON, `true` becomes Python True (bool),
        # not the string "true", so check for both forms and convert to -1
        # to indicate "always hits". If missing, default to 100.
        if accuracy is True or accuracy == "true":
            accuracy = -1
        elif accuracy is None:
            accuracy = 100
        elif isinstance(accuracy, str):
            # Try to parse numeric strings (some sources may store numbers as strings)
            try:
                accuracy = int(accuracy)
            except ValueError:
                # Fallback default for unexpected string values
                accuracy = 100
        priority = move.get('priority', 0) or 0
        pp = move.get('pp', 0) or 0
        short_description = move.get('shortDesc', '')
        long_description = move.get('desc', '')
        has_secondary_effect = int(bool(move.get('secondary')))
        is_multi_hit = int(bool(move.get('multihit')))
        multi_hit_high = move.get('multihit')[1] if isinstance(move.get('multihit'), list) else None
        multi_hit_low = move.get('multihit')[0] if isinstance(move.get('multihit'), list) else None
        ignores_substitute = int('bypasssub' in move.get('flags', {}))
        ignores_protect = int('protect' not in move.get('flags', {}) and category != "Status")
        bounceable = int('reflectable' in move.get('flags', {}))
        bite = int('bite' in move.get('flags', {}))
        bullet = int('bullet' in move.get('flags', {}))
        contact = int('contact' in move.get('flags', {}))
        dance = int('dance' in move.get('flags', {}))
        heal = int('heal' in move.get('flags', {}))
        powder = int('powder' in move.get('flags', {}))
        pulse = int('pulse' in move.get('flags', {}))
        punch = int('punch' in move.get('flags', {}))
        slice = int('slice' in move.get('flags', {}))
        sound = int('sound' in move.get('flags', {}))
        wind = int('wind' in move.get('flags', {}))
        boosted_by_sheer_force = int(move.get('hasSheerForce', False) or has_secondary_effect)
        ohko = int('ohko' in move)
        is_z_move = int('isZ' in move)
        is_max_move = int('isMax' in move)
        is_legal = int(not move.get('isNonstandard', False))

        row = {
            'name': name,
            'type': type_,
            'dex_num': dex_num,
            'category': category,
            'target': target,
            'power': power,
            'accuracy': accuracy,
            'priority': priority,
            'pp': pp,
            'short_description': short_description,
            'long_description': long_description,
            'has_secondary_effect': has_secondary_effect,
            'is_multi_hit': is_multi_hit,
            'multi_hit_high': multi_hit_high,
            'multi_hit_low': multi_hit_low,
            'ignores_substitute': ignores_substitute,
            'ignores_protect': ignores_protect,
            'bounceable': bounceable,
            'bite': bite,
            'bullet': bullet,
            'contact': contact,
            'dance': dance,
            'heal': heal,
            'powder': powder,
            'pulse': pulse,
            'punch': punch,
            'slice': slice,
            'sound': sound,
            'wind': wind,
            'boosted_by_sheer_force': boosted_by_sheer_force,
            'ohko': ohko,
            'is_z_move': is_z_move,
            'is_max_move': is_max_move,
            'is_legal': is_legal
        }
        rows.append(row)
    
    with open(csv_path, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)

if __name__ == "__main__":
	json_path = os.path.join(os.path.dirname(__file__), 'showdown_jsons', 'moves.json')
	csv_path = os.path.join(os.path.dirname(__file__), 'moves.csv')
	convert_moves_to_csv(json_path, csv_path)