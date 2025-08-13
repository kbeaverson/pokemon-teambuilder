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
  Ability get ability;
  Pokemon get pokemon;
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
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ability, pokemon, isHidden);

  @override
  String toString() {
    return 'AbilityPoolEntry(ability: $ability, pokemon: $pokemon, isHidden: $isHidden)';
  }
}

/// @nodoc
abstract mixin class $AbilityPoolEntryCopyWith<$Res> {
  factory $AbilityPoolEntryCopyWith(
          AbilityPoolEntry value, $Res Function(AbilityPoolEntry) _then) =
      _$AbilityPoolEntryCopyWithImpl;
  @useResult
  $Res call({Ability ability, Pokemon pokemon, bool isHidden});
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
    Object? ability = null,
    Object? pokemon = null,
    Object? isHidden = null,
  }) {
    return _then(AbilityPoolEntry(
      ability: null == ability
          ? _self.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability,
      pokemon: null == pokemon
          ? _self.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon,
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
