// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ability {
  String get id;
  String get name;
  int get dexNum;
  String get description;
  bool get blockedByNeutGas;
  bool get ignored;

  /// Create a copy of Ability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AbilityCopyWith<Ability> get copyWith =>
      _$AbilityCopyWithImpl<Ability>(this as Ability, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ability &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dexNum, dexNum) || other.dexNum == dexNum) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.blockedByNeutGas, blockedByNeutGas) ||
                other.blockedByNeutGas == blockedByNeutGas) &&
            (identical(other.ignored, ignored) || other.ignored == ignored));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, dexNum, description, blockedByNeutGas, ignored);

  @override
  String toString() {
    return 'Ability(id: $id, name: $name, dexNum: $dexNum, description: $description, blockedByNeutGas: $blockedByNeutGas, ignored: $ignored)';
  }
}

/// @nodoc
abstract mixin class $AbilityCopyWith<$Res> {
  factory $AbilityCopyWith(Ability value, $Res Function(Ability) _then) =
      _$AbilityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      int dexNum,
      String description,
      bool blockedByNeutGas,
      bool ignored});
}

/// @nodoc
class _$AbilityCopyWithImpl<$Res> implements $AbilityCopyWith<$Res> {
  _$AbilityCopyWithImpl(this._self, this._then);

  final Ability _self;
  final $Res Function(Ability) _then;

  /// Create a copy of Ability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dexNum = null,
    Object? description = null,
    Object? blockedByNeutGas = null,
    Object? ignored = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dexNum: null == dexNum
          ? _self.dexNum
          : dexNum // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      blockedByNeutGas: null == blockedByNeutGas
          ? _self.blockedByNeutGas
          : blockedByNeutGas // ignore: cast_nullable_to_non_nullable
              as bool,
      ignored: null == ignored
          ? _self.ignored
          : ignored // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Ability].
extension AbilityPatterns on Ability {
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
    TResult Function(_Ability value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Ability() when $default != null:
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
    TResult Function(_Ability value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ability():
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
    TResult? Function(_Ability value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ability() when $default != null:
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
    TResult Function(String id, String name, int dexNum, String description,
            bool blockedByNeutGas, bool ignored)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Ability() when $default != null:
        return $default(_that.id, _that.name, _that.dexNum, _that.description,
            _that.blockedByNeutGas, _that.ignored);
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
    TResult Function(String id, String name, int dexNum, String description,
            bool blockedByNeutGas, bool ignored)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ability():
        return $default(_that.id, _that.name, _that.dexNum, _that.description,
            _that.blockedByNeutGas, _that.ignored);
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
    TResult? Function(String id, String name, int dexNum, String description,
            bool blockedByNeutGas, bool ignored)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ability() when $default != null:
        return $default(_that.id, _that.name, _that.dexNum, _that.description,
            _that.blockedByNeutGas, _that.ignored);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Ability implements Ability {
  const _Ability(
      {required this.id,
      required this.name,
      required this.dexNum,
      required this.description,
      required this.blockedByNeutGas,
      required this.ignored});

  @override
  final String id;
  @override
  final String name;
  @override
  final int dexNum;
  @override
  final String description;
  @override
  final bool blockedByNeutGas;
  @override
  final bool ignored;

  /// Create a copy of Ability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AbilityCopyWith<_Ability> get copyWith =>
      __$AbilityCopyWithImpl<_Ability>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ability &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dexNum, dexNum) || other.dexNum == dexNum) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.blockedByNeutGas, blockedByNeutGas) ||
                other.blockedByNeutGas == blockedByNeutGas) &&
            (identical(other.ignored, ignored) || other.ignored == ignored));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, dexNum, description, blockedByNeutGas, ignored);

  @override
  String toString() {
    return 'Ability(id: $id, name: $name, dexNum: $dexNum, description: $description, blockedByNeutGas: $blockedByNeutGas, ignored: $ignored)';
  }
}

/// @nodoc
abstract mixin class _$AbilityCopyWith<$Res> implements $AbilityCopyWith<$Res> {
  factory _$AbilityCopyWith(_Ability value, $Res Function(_Ability) _then) =
      __$AbilityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int dexNum,
      String description,
      bool blockedByNeutGas,
      bool ignored});
}

/// @nodoc
class __$AbilityCopyWithImpl<$Res> implements _$AbilityCopyWith<$Res> {
  __$AbilityCopyWithImpl(this._self, this._then);

  final _Ability _self;
  final $Res Function(_Ability) _then;

  /// Create a copy of Ability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dexNum = null,
    Object? description = null,
    Object? blockedByNeutGas = null,
    Object? ignored = null,
  }) {
    return _then(_Ability(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dexNum: null == dexNum
          ? _self.dexNum
          : dexNum // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      blockedByNeutGas: null == blockedByNeutGas
          ? _self.blockedByNeutGas
          : blockedByNeutGas // ignore: cast_nullable_to_non_nullable
              as bool,
      ignored: null == ignored
          ? _self.ignored
          : ignored // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
