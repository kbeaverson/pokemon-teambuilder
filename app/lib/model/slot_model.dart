import 'package:app/model/ability_pool_entry_model.dart';
import 'package:app/model/item_model.dart';
import 'package:app/model/move_pool_entry.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:app/utils/nature.dart';
import 'package:app/utils/pokemon_type.dart';
import 'package:app/utils/stat.dart';
import 'package:uuid/uuid.dart';

/// A fully customizable model for a pokemon set
class Slot {
  Slot({
    String? id,
    this.pokemon,
    List<MovePoolEntry>? moves,
    this.ability,
    this.item,
    this.nature = Nature.docile,
    Map<Stat, int>? ivs,
    Map<Stat, int>? evs,
    this.teraType,
    this.isGigantamax = false,
    this.notes,
    this.isDirty = true,
  }) : id = id ?? const Uuid().v4(),
      moves = moves ?? [],
      ivs = ivs ?? {
        Stat.hp : 31,
        Stat.atk : 31,
        Stat.def : 31,
        Stat.spa : 31,
        Stat.spd : 31,
        Stat.spe : 31,
      },
      evs = evs ?? {
        Stat.hp : 0,
        Stat.atk : 0,
        Stat.def : 0,
        Stat.spa : 0,
        Stat.spd : 0,
        Stat.spe : 0,
      };

  final String id;
  Pokemon? pokemon;
  List<MovePoolEntry> moves;
  AbilityPoolEntry? ability;
  Item? item;
  Nature nature;
  Map<Stat, int> ivs;
  Map<Stat, int> evs;
  PokemonType? teraType;
  bool isGigantamax;
  String? notes;
  bool isDirty;

  @override
  String toString() {
    return 'Slot(id: $id, pokemon: ($pokemon), moves: ($moves), ability: ($ability), item: ($item), nature: $nature, ivs: ($ivs), evs: ($evs), teraType: $teraType, isGigantamax: $isGigantamax, notes: $notes, isDirty: $isDirty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Slot 
    && other.id == id
    && other.pokemon == pokemon
    && other.moves == moves
    && other.ability == ability
    && other.item == item
    && other.nature == nature
    && other.ivs == ivs
    && other.evs == evs
    && other.teraType == teraType
    && other.isGigantamax == isGigantamax
    && other.notes == notes
    && other.isDirty == isDirty;
  }

  @override
  int get hashCode => Object.hash(id.hashCode, pokemon.hashCode, moves.hashCode, ability.hashCode, item.hashCode, nature.hashCode, ivs.hashCode, evs.hashCode, teraType.hashCode, isGigantamax.hashCode, notes.hashCode, isDirty.hashCode);
}