// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_pool_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovePoolEntry {
  Move get move;
  Pokemon get pokemon;
  LearnMethod get learnMethod;
  int? get levelupLevel;

  /// Create a copy of MovePoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovePoolEntryCopyWith<MovePoolEntry> get copyWith =>
      _$MovePoolEntryCopyWithImpl<MovePoolEntry>(
          this as MovePoolEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovePoolEntry &&
            (identical(other.move, move) || other.move == move) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            (identical(other.learnMethod, learnMethod) ||
                other.learnMethod == learnMethod) &&
            (identical(other.levelupLevel, levelupLevel) ||
                other.levelupLevel == levelupLevel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, move, pokemon, learnMethod, levelupLevel);

  @override
  String toString() {
    return 'MovePoolEntry(move: $move, pokemon: $pokemon, learnMethod: $learnMethod, levelupLevel: $levelupLevel)';
  }
}

/// @nodoc
abstract mixin class $MovePoolEntryCopyWith<$Res> {
  factory $MovePoolEntryCopyWith(
          MovePoolEntry value, $Res Function(MovePoolEntry) _then) =
      _$MovePoolEntryCopyWithImpl;
  @useResult
  $Res call(
      {Move move, Pokemon pokemon, LearnMethod learnMethod, int? levelupLevel});
}

/// @nodoc
class _$MovePoolEntryCopyWithImpl<$Res>
    implements $MovePoolEntryCopyWith<$Res> {
  _$MovePoolEntryCopyWithImpl(this._self, this._then);

  final MovePoolEntry _self;
  final $Res Function(MovePoolEntry) _then;

  /// Create a copy of MovePoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? move = null,
    Object? pokemon = null,
    Object? learnMethod = null,
    Object? levelupLevel = freezed,
  }) {
    return _then(MovePoolEntry(
      move: null == move
          ? _self.move
          : move // ignore: cast_nullable_to_non_nullable
              as Move,
      pokemon: null == pokemon
          ? _self.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      learnMethod: null == learnMethod
          ? _self.learnMethod
          : learnMethod // ignore: cast_nullable_to_non_nullable
              as LearnMethod,
      levelupLevel: freezed == levelupLevel
          ? _self.levelupLevel
          : levelupLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MovePoolEntry].
extension MovePoolEntryPatterns on MovePoolEntry {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>() {
    final _that = this;
    switch (_that) {
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>() {
    final _that = this;
    switch (_that) {
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>() {
    final _that = this;
    switch (_that) {
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>() {
    final _that = this;
    switch (_that) {
      case _:
        return null;
    }
  }
}

// dart format on
