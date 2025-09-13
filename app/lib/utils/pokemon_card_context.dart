import 'package:app/model/static_models/ability_pool_entry_model.dart';
import 'package:app/model/static_models/move_pool_entry.dart';
import 'package:app/utils/enums/build_around_behavior.dart';

/// Abstract class representing the context from which a build-around action is initiated.
abstract class PokemonCardContext {}

class FromPokedex extends PokemonCardContext {
  final BuildAroundBehavior behavior;
  FromPokedex({this.behavior = BuildAroundBehavior.enabled});
}

/// Context for building around a specific move from the movepoolentry list item of a Pokemon.
class FromMovepool extends PokemonCardContext {
  final BuildAroundBehavior behavior;
  final MovePoolEntry move;
  FromMovepool({
    this.behavior = BuildAroundBehavior.enabled,
    required this.move,
  });
}

/// Context for building around a specific ability from the abilitypoolentry list item of a Pokemon.
class FromAbilitypool extends PokemonCardContext {
  final BuildAroundBehavior behavior;
  final AbilityPoolEntry ability;
  FromAbilitypool({
    this.behavior = BuildAroundBehavior.enabled,
    required this.ability,
  });
}

class FromTeambuilder extends PokemonCardContext {
  final BuildAroundBehavior behavior;
  FromTeambuilder({this.behavior = BuildAroundBehavior.disabled});
}