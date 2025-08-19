// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Team {
  String get id;
  String get name;
  String? get description;
  List<String> get memberIds;
  String? get regulationId;
  String? get rentalCode;
  bool get isDirty;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TeamCopyWith<Team> get copyWith =>
      _$TeamCopyWithImpl<Team>(this as Team, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Team &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.memberIds, memberIds) &&
            (identical(other.regulationId, regulationId) ||
                other.regulationId == regulationId) &&
            (identical(other.rentalCode, rentalCode) ||
                other.rentalCode == rentalCode) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(memberIds),
      regulationId,
      rentalCode,
      isDirty);

  @override
  String toString() {
    return 'Team(id: $id, name: $name, description: $description, memberIds: $memberIds, regulationId: $regulationId, rentalCode: $rentalCode, isDirty: $isDirty)';
  }
}

/// @nodoc
abstract mixin class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) _then) =
      _$TeamCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      List<String> memberIds,
      String? regulationId,
      String? rentalCode,
      bool isDirty});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._self, this._then);

  final Team _self;
  final $Res Function(Team) _then;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? memberIds = null,
    Object? regulationId = freezed,
    Object? rentalCode = freezed,
    Object? isDirty = null,
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
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      memberIds: null == memberIds
          ? _self.memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      regulationId: freezed == regulationId
          ? _self.regulationId
          : regulationId // ignore: cast_nullable_to_non_nullable
              as String?,
      rentalCode: freezed == rentalCode
          ? _self.rentalCode
          : rentalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirty: null == isDirty
          ? _self.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Team].
extension TeamPatterns on Team {
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
    TResult Function(_Team value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Team() when $default != null:
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
    TResult Function(_Team value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Team():
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
    TResult? Function(_Team value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Team() when $default != null:
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
            String id,
            String name,
            String? description,
            List<String> memberIds,
            String? regulationId,
            String? rentalCode,
            bool isDirty)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Team() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.memberIds,
            _that.regulationId,
            _that.rentalCode,
            _that.isDirty);
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
            String id,
            String name,
            String? description,
            List<String> memberIds,
            String? regulationId,
            String? rentalCode,
            bool isDirty)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Team():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.memberIds,
            _that.regulationId,
            _that.rentalCode,
            _that.isDirty);
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
            String id,
            String name,
            String? description,
            List<String> memberIds,
            String? regulationId,
            String? rentalCode,
            bool isDirty)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Team() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.memberIds,
            _that.regulationId,
            _that.rentalCode,
            _that.isDirty);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Team implements Team {
  const _Team(
      {required this.id,
      this.name = "Untitled",
      this.description,
      final List<String> memberIds = const [],
      this.regulationId,
      this.rentalCode,
      this.isDirty = true})
      : _memberIds = memberIds;

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  final String? description;
  final List<String> _memberIds;
  @override
  @JsonKey()
  List<String> get memberIds {
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberIds);
  }

  @override
  final String? regulationId;
  @override
  final String? rentalCode;
  @override
  @JsonKey()
  final bool isDirty;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Team &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._memberIds, _memberIds) &&
            (identical(other.regulationId, regulationId) ||
                other.regulationId == regulationId) &&
            (identical(other.rentalCode, rentalCode) ||
                other.rentalCode == rentalCode) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_memberIds),
      regulationId,
      rentalCode,
      isDirty);

  @override
  String toString() {
    return 'Team(id: $id, name: $name, description: $description, memberIds: $memberIds, regulationId: $regulationId, rentalCode: $rentalCode, isDirty: $isDirty)';
  }
}

/// @nodoc
abstract mixin class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) _then) =
      __$TeamCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      List<String> memberIds,
      String? regulationId,
      String? rentalCode,
      bool isDirty});
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(this._self, this._then);

  final _Team _self;
  final $Res Function(_Team) _then;

  /// Create a copy of Team
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? memberIds = null,
    Object? regulationId = freezed,
    Object? rentalCode = freezed,
    Object? isDirty = null,
  }) {
    return _then(_Team(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      memberIds: null == memberIds
          ? _self._memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      regulationId: freezed == regulationId
          ? _self.regulationId
          : regulationId // ignore: cast_nullable_to_non_nullable
              as String?,
      rentalCode: freezed == rentalCode
          ? _self.rentalCode
          : rentalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirty: null == isDirty
          ? _self.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
