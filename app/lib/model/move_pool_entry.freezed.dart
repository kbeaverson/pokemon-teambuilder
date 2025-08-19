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
  String get moveId;
  String get pokemonId;
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
            (identical(other.moveId, moveId) || other.moveId == moveId) &&
            (identical(other.pokemonId, pokemonId) ||
                other.pokemonId == pokemonId) &&
            (identical(other.learnMethod, learnMethod) ||
                other.learnMethod == learnMethod) &&
            (identical(other.levelupLevel, levelupLevel) ||
                other.levelupLevel == levelupLevel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, moveId, pokemonId, learnMethod, levelupLevel);

  @override
  String toString() {
    return 'MovePoolEntry(moveId: $moveId, pokemonId: $pokemonId, learnMethod: $learnMethod, levelupLevel: $levelupLevel)';
  }
}

/// @nodoc
abstract mixin class $MovePoolEntryCopyWith<$Res> {
  factory $MovePoolEntryCopyWith(
          MovePoolEntry value, $Res Function(MovePoolEntry) _then) =
      _$MovePoolEntryCopyWithImpl;
  @useResult
  $Res call(
      {String moveId,
      String pokemonId,
      LearnMethod learnMethod,
      int? levelupLevel});
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
    Object? moveId = null,
    Object? pokemonId = null,
    Object? learnMethod = null,
    Object? levelupLevel = freezed,
  }) {
    return _then(_self.copyWith(
      moveId: null == moveId
          ? _self.moveId
          : moveId // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonId: null == pokemonId
          ? _self.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as String,
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MovePoolEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovePoolEntry() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_MovePoolEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovePoolEntry():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MovePoolEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovePoolEntry() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String moveId, String pokemonId, LearnMethod learnMethod,
            int? levelupLevel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovePoolEntry() when $default != null:
        return $default(_that.moveId, _that.pokemonId, _that.learnMethod,
            _that.levelupLevel);
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
  TResult when<TResult extends Object?>(
    TResult Function(String moveId, String pokemonId, LearnMethod learnMethod,
            int? levelupLevel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovePoolEntry():
        return $default(_that.moveId, _that.pokemonId, _that.learnMethod,
            _that.levelupLevel);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String moveId, String pokemonId, LearnMethod learnMethod,
            int? levelupLevel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovePoolEntry() when $default != null:
        return $default(_that.moveId, _that.pokemonId, _that.learnMethod,
            _that.levelupLevel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MovePoolEntry implements MovePoolEntry {
  const _MovePoolEntry(
      {required this.moveId,
      required this.pokemonId,
      required this.learnMethod,
      this.levelupLevel});

  @override
  final String moveId;
  @override
  final String pokemonId;
  @override
  final LearnMethod learnMethod;
  @override
  final int? levelupLevel;

  /// Create a copy of MovePoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovePoolEntryCopyWith<_MovePoolEntry> get copyWith =>
      __$MovePoolEntryCopyWithImpl<_MovePoolEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovePoolEntry &&
            (identical(other.moveId, moveId) || other.moveId == moveId) &&
            (identical(other.pokemonId, pokemonId) ||
                other.pokemonId == pokemonId) &&
            (identical(other.learnMethod, learnMethod) ||
                other.learnMethod == learnMethod) &&
            (identical(other.levelupLevel, levelupLevel) ||
                other.levelupLevel == levelupLevel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, moveId, pokemonId, learnMethod, levelupLevel);

  @override
  String toString() {
    return 'MovePoolEntry(moveId: $moveId, pokemonId: $pokemonId, learnMethod: $learnMethod, levelupLevel: $levelupLevel)';
  }
}

/// @nodoc
abstract mixin class _$MovePoolEntryCopyWith<$Res>
    implements $MovePoolEntryCopyWith<$Res> {
  factory _$MovePoolEntryCopyWith(
          _MovePoolEntry value, $Res Function(_MovePoolEntry) _then) =
      __$MovePoolEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String moveId,
      String pokemonId,
      LearnMethod learnMethod,
      int? levelupLevel});
}

/// @nodoc
class __$MovePoolEntryCopyWithImpl<$Res>
    implements _$MovePoolEntryCopyWith<$Res> {
  __$MovePoolEntryCopyWithImpl(this._self, this._then);

  final _MovePoolEntry _self;
  final $Res Function(_MovePoolEntry) _then;

  /// Create a copy of MovePoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? moveId = null,
    Object? pokemonId = null,
    Object? learnMethod = null,
    Object? levelupLevel = freezed,
  }) {
    return _then(_MovePoolEntry(
      moveId: null == moveId
          ? _self.moveId
          : moveId // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonId: null == pokemonId
          ? _self.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as String,
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

// dart format on
