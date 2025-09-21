import 'package:app/utils/enums/build_around_behavior.dart';

abstract class MoveCardContext {}

class FromMoveDex implements MoveCardContext {
  BuildAroundBehavior buildAroundBehavior;
  FromMoveDex({this.buildAroundBehavior = BuildAroundBehavior.enabled});
}

class FromTeamBuilder implements MoveCardContext {
  BuildAroundBehavior buildAroundBehavior;
  FromTeamBuilder({this.buildAroundBehavior = BuildAroundBehavior.disabled});
}