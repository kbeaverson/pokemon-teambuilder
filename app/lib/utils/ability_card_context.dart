import 'package:app/utils/enums/build_around_behavior.dart';

abstract class AbilityCardContext {}

class FromAbilitydex extends AbilityCardContext {
  final BuildAroundBehavior behavior;
  FromAbilitydex({this.behavior = BuildAroundBehavior.enabled});
}

class FromTeamBuilder extends AbilityCardContext {
  final BuildAroundBehavior behavior;
  FromTeamBuilder({this.behavior = BuildAroundBehavior.disabled});
}
