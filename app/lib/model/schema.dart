import 'package:powersync/powersync.dart';

const schema = Schema([
  Table('pokemon', [
    Column.text('name'),
    Column.integer('dex_num'),
    Column.text('type'),
    Column.integer('is_pre_evolution'),
    Column.real('weight'),
    Column.integer('gender_ratio'),
    Column.integer('is_mythical'),
    Column.integer('is_legendary'),
    Column.integer('is_max'),
    Column.integer('is_mega'),
    Column.text('mandatory_item_name'),
    Column.text('base_stats')
  ]),
  Table('moves', [
    Column.text('name'),
    Column.integer('dex_num'),
    Column.text('type'),
    Column.text('category'),
    Column.text('target'),
    Column.integer('power'),
    Column.integer('accuracy'),
    Column.integer('priority'),
    Column.integer('pp'),
    Column.text('short_description'),
    Column.text('long_description'),
    Column.integer('has_secondary_effect'),
    Column.integer('is_multi_hit'),
    Column.integer('multi_hit_high'),
    Column.integer('multi_hit_low'),
    Column.integer('ignores_substitute'),
    Column.integer('ignores_protect'),
    Column.integer('bounceable'),
    Column.integer('bite'),
    Column.integer('bullet'),
    Column.integer('contact'),
    Column.integer('dance'),
    Column.integer('heal'),
    Column.integer('powder'),
    Column.integer('pulse'),
    Column.integer('punch'),
    Column.integer('slice'),
    Column.integer('sound'),
    Column.integer('wind'),
    Column.integer('boosted_by_sheer_force'),
    Column.integer('ohko'),
    Column.integer('is_z_move'),
    Column.integer('is_max_move'),
    Column.integer('is_legal')
  ]),
  Table('abilities', [
    Column.text('name'),
    Column.integer('dex_num'),
    Column.text('description'),
    Column.integer('blocked_by_neut_gas'),
    Column.integer('ignored')
  ]),
  Table('items', [
    Column.text('name'),
    Column.integer('dex_num'),
    Column.integer('fling_power'),
    Column.integer('ignored_by_klutz'),
    Column.text('category'),
    Column.text('description')
  ]),
  Table('regulations', [
    Column.text('name'),
    Column.integer('is_dynamax_legal'),
    Column.integer('is_mega_legal'),
    Column.integer('is_tera_legal')
  ]),
  Table('regulation_clauses', [
    Column.text('regulation_id'),
    Column.text('clause_config')
  ]),
  Table('movepools', [
    Column.text('pokemon_id'),
    Column.text('move_id'),
    Column.integer('is_egg_move'),
    Column.integer('is_tm_move'),
    Column.integer('is_levelup_move'),
    Column.integer('levelup_level')
  ]),
  Table('abilitypools', [
    Column.text('pokemon_id'),
    Column.text('ability_id'),
    Column.integer('is_hidden_ability')
  ]),
  Table('teams', [
    Column.text('created_at'),
    Column.text('name'),
    Column.text('regulation_id'),
    Column.text('description'),
    Column.text('rental_code'),
    Column.text('member_ids'),
  ]),
  Table('slots', [
    Column.text('created_at'),
    Column.text('pokemon_id'),
    Column.text('ability_id'),
    Column.text('item_id'),
    Column.text('tera_type'),
    Column.integer('is_gigantamax'),
    Column.text('notes'),
    Column.text('nature'),
    Column.text('move_ids'),
    Column.text('ivs'),
    Column.text('evs'),
    Column.text('team_id'),
  ]),
  Table('bank', [
    Column.text('user_id'),
    Column.text('slot_id')
  ])
]);
