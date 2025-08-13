import 'package:app/model/ability_pool_entry_model.dart';
import 'package:app/model/item_model.dart';
import 'package:app/model/move_pool_entry.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:app/utils/nature.dart';
import 'package:app/utils/pokemon_type.dart';
import 'package:app/utils/stat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'slot_model.freezed.dart';
/// A fully customizable model for a pokemon set
@freezed
abstract class Slot with _$Slot {
  const factory Slot({
    required String id,
    Pokemon? pokemon,
    List<MovePoolEntry>? moves,
    AbilityPoolEntry? ability,
    Item? item,
    @Default(Nature.docile) Nature nature,
    @Default({
      Stat.hp : 31,
      Stat.atk : 31,
      Stat.def : 31,
      Stat.spa : 31,
      Stat.spd : 31,
      Stat.spe : 31,
    }) Map<Stat, int> ivs,
    @Default({
      Stat.hp : 0,
      Stat.atk : 0,
      Stat.def : 0,
      Stat.spa : 0,
      Stat.spd : 0,
      Stat.spe : 0,
    }) Map<Stat, int> evs,
    PokemonType? teraType,
    @Default(false) bool isGigantamax,
    String? notes,
    @Default(true) bool isDirty,
  }) = _Slot;

  factory Slot.newSlot({
    Pokemon? pokemon,
    List<MovePoolEntry>? moves,
    AbilityPoolEntry? ability,
    Item? item,
    Nature nature = Nature.docile,
    Map<Stat, int> ivs = const {
      Stat.hp : 31,
      Stat.atk : 31,
      Stat.def : 31,
      Stat.spa : 31,
      Stat.spd : 31,
      Stat.spe : 31,
    },
    Map<Stat, int> evs = const {
      Stat.hp : 0,
      Stat.atk : 0,
      Stat.def : 0,
      Stat.spa : 0,
      Stat.spd : 0,
      Stat.spe : 0,
    },
    PokemonType? teraType,
    bool isGigantamax = false,
    String? notes,
    bool isDirty = true,
  }) {
    return Slot(
      id: const Uuid().v4(),
      pokemon: pokemon,
      moves: moves,
      ability: ability,
      item: item,
      nature: nature,
      ivs: ivs,
      evs: evs,
      teraType: teraType,
      isGigantamax: isGigantamax,
      notes: notes,
      isDirty: isDirty,
    );
  }
}