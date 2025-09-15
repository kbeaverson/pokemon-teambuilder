import 'package:app/utils/enums/build_around_behavior.dart';

abstract class ItemCardContext {}

class FromItemdex extends ItemCardContext {
  final BuildAroundBehavior buildAroundBehavior;
  FromItemdex({this.buildAroundBehavior = BuildAroundBehavior.enabled});
}

class FromTeamBuilder extends ItemCardContext {
  final BuildAroundBehavior buildAroundBehavior;
  FromTeamBuilder({this.buildAroundBehavior = BuildAroundBehavior.disabled});
}