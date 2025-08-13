import 'package:app/model/move_model.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:app/utils/learn_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_pool_entry.freezed.dart';
/// A move/pokemon pair that contains the learn method of the move for the pokemon
@freezed
abstract class MovePoolEntry with _$MovePoolEntry{
  const factory MovePoolEntry ({
    required Move move,
    required Pokemon pokemon,
    required LearnMethod learnMethod,
    int? levelupLevel,
  }) = _MovePoolEntry;
}