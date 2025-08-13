import 'package:app/model/move_model.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:app/utils/learn_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_pool_entry.freezed.dart';
/// A move/pokemon pair that contains the learn method of the move for the pokemon
@freezed
class MovePoolEntry with _$MovePoolEntry{
  const MovePoolEntry ({
    required this.move,
    required this.pokemon,
    required this.learnMethod,
    required this.levelupLevel,
  });

  @override
  final Move move;
  @override
  final Pokemon pokemon;
  @override
  final LearnMethod learnMethod;
  @override
  final int? levelupLevel;
}