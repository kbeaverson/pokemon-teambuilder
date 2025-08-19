// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability_pool_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbilityPoolEntry {
  String get id;
  String? get abilityId;
  String? get pokemonId;
  bool get isHidden;

  /// Create a copy of AbilityPoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AbilityPoolEntryCopyWith<AbilityPoolEntry> get copyWith =>
      _$AbilityPoolEntryCopyWithImpl<AbilityPoolEntry>(
          this as AbilityPoolEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AbilityPoolEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.abilityId, abilityId) ||
                other.abilityId == abilityId) &&
            (identical(other.pokemonId, pokemonId) ||
                other.pokemonId == pokemonId) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, abilityId, pokemonId, isHidden);

  @override
  String toString() {
    return 'AbilityPoolEntry(id: $id, abilityId: $abilityId, pokemonId: $pokemonId, isHidden: $isHidden)';
  }
}

/// @nodoc
abstract mixin class $AbilityPoolEntryCopyWith<$Res> {
  factory $AbilityPoolEntryCopyWith(
          AbilityPoolEntry value, $Res Function(AbilityPoolEntry) _then) =
      _$AbilityPoolEntryCopyWithImpl;
  @useResult
  $Res call({String id, String? abilityId, String? pokemonId, bool isHidden});
}

/// @nodoc
class _$AbilityPoolEntryCopyWithImpl<$Res>
    implements $AbilityPoolEntryCopyWith<$Res> {
  _$AbilityPoolEntryCopyWithImpl(this._self, this._then);

  final AbilityPoolEntry _self;
  final $Res Function(AbilityPoolEntry) _then;

  /// Create a copy of AbilityPoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? abilityId = freezed,
    Object? pokemonId = freezed,
    Object? isHidden = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      abilityId: freezed == abilityId
          ? _self.abilityId
          : abilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemonId: freezed == pokemonId
          ? _self.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as String?,
      isHidden: null == isHidden
          ? _self.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AbilityPoolEntry].
extension AbilityPoolEntryPatterns on AbilityPoolEntry {
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
    TResult Function(_AbilityPoolEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AbilityPoolEntry() when $default != null:
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
    TResult Function(_AbilityPoolEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbilityPoolEntry():
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
    TResult? Function(_AbilityPoolEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbilityPoolEntry() when $default != null:
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
    TResult Function(
            String id, String? abilityId, String? pokemonId, bool isHidden)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AbilityPoolEntry() when $default != null:
        return $default(
            _that.id, _that.abilityId, _that.pokemonId, _that.isHidden);
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
    TResult Function(
            String id, String? abilityId, String? pokemonId, bool isHidden)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbilityPoolEntry():
        return $default(
            _that.id, _that.abilityId, _that.pokemonId, _that.isHidden);
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
    TResult? Function(
            String id, String? abilityId, String? pokemonId, bool isHidden)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbilityPoolEntry() when $default != null:
        return $default(
            _that.id, _that.abilityId, _that.pokemonId, _that.isHidden);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AbilityPoolEntry implements AbilityPoolEntry {
  const _AbilityPoolEntry(
      {required this.id,
      this.abilityId,
      this.pokemonId,
      required this.isHidden});

  @override
  final String id;
  @override
  final String? abilityId;
  @override
  final String? pokemonId;
  @override
  final bool isHidden;

  /// Create a copy of AbilityPoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AbilityPoolEntryCopyWith<_AbilityPoolEntry> get copyWith =>
      __$AbilityPoolEntryCopyWithImpl<_AbilityPoolEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AbilityPoolEntry &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.abilityId, abilityId) ||
                other.abilityId == abilityId) &&
            (identical(other.pokemonId, pokemonId) ||
                other.pokemonId == pokemonId) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, abilityId, pokemonId, isHidden);

  @override
  String toString() {
    return 'AbilityPoolEntry(id: $id, abilityId: $abilityId, pokemonId: $pokemonId, isHidden: $isHidden)';
  }
}

/// @nodoc
abstract mixin class _$AbilityPoolEntryCopyWith<$Res>
    implements $AbilityPoolEntryCopyWith<$Res> {
  factory _$AbilityPoolEntryCopyWith(
          _AbilityPoolEntry value, $Res Function(_AbilityPoolEntry) _then) =
      __$AbilityPoolEntryCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String? abilityId, String? pokemonId, bool isHidden});
}

/// @nodoc
class __$AbilityPoolEntryCopyWithImpl<$Res>
    implements _$AbilityPoolEntryCopyWith<$Res> {
  __$AbilityPoolEntryCopyWithImpl(this._self, this._then);

  final _AbilityPoolEntry _self;
  final $Res Function(_AbilityPoolEntry) _then;

  /// Create a copy of AbilityPoolEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? abilityId = freezed,
    Object? pokemonId = freezed,
    Object? isHidden = null,
  }) {
    return _then(_AbilityPoolEntry(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      abilityId: freezed == abilityId
          ? _self.abilityId
          : abilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemonId: freezed == pokemonId
          ? _self.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as String?,
      isHidden: null == isHidden
          ? _self.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
