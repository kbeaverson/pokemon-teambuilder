// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regulation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Regulation {
  String get id;
  String get name;
  List<String> get clauseIds;
  bool get isDynamaxLegal;
  bool get isMegaLegal;
  bool get isTeraLegal;

  /// Create a copy of Regulation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegulationCopyWith<Regulation> get copyWith =>
      _$RegulationCopyWithImpl<Regulation>(this as Regulation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Regulation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.clauseIds, clauseIds) &&
            (identical(other.isDynamaxLegal, isDynamaxLegal) ||
                other.isDynamaxLegal == isDynamaxLegal) &&
            (identical(other.isMegaLegal, isMegaLegal) ||
                other.isMegaLegal == isMegaLegal) &&
            (identical(other.isTeraLegal, isTeraLegal) ||
                other.isTeraLegal == isTeraLegal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(clauseIds),
      isDynamaxLegal,
      isMegaLegal,
      isTeraLegal);

  @override
  String toString() {
    return 'Regulation(id: $id, name: $name, clauseIds: $clauseIds, isDynamaxLegal: $isDynamaxLegal, isMegaLegal: $isMegaLegal, isTeraLegal: $isTeraLegal)';
  }
}

/// @nodoc
abstract mixin class $RegulationCopyWith<$Res> {
  factory $RegulationCopyWith(
          Regulation value, $Res Function(Regulation) _then) =
      _$RegulationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> clauseIds,
      bool isDynamaxLegal,
      bool isMegaLegal,
      bool isTeraLegal});
}

/// @nodoc
class _$RegulationCopyWithImpl<$Res> implements $RegulationCopyWith<$Res> {
  _$RegulationCopyWithImpl(this._self, this._then);

  final Regulation _self;
  final $Res Function(Regulation) _then;

  /// Create a copy of Regulation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? clauseIds = null,
    Object? isDynamaxLegal = null,
    Object? isMegaLegal = null,
    Object? isTeraLegal = null,
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
      clauseIds: null == clauseIds
          ? _self.clauseIds
          : clauseIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isDynamaxLegal: null == isDynamaxLegal
          ? _self.isDynamaxLegal
          : isDynamaxLegal // ignore: cast_nullable_to_non_nullable
              as bool,
      isMegaLegal: null == isMegaLegal
          ? _self.isMegaLegal
          : isMegaLegal // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeraLegal: null == isTeraLegal
          ? _self.isTeraLegal
          : isTeraLegal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Regulation].
extension RegulationPatterns on Regulation {
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
    TResult Function(_Regulation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Regulation() when $default != null:
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
    TResult Function(_Regulation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Regulation():
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
    TResult? Function(_Regulation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Regulation() when $default != null:
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
    TResult Function(String id, String name, List<String> clauseIds,
            bool isDynamaxLegal, bool isMegaLegal, bool isTeraLegal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Regulation() when $default != null:
        return $default(_that.id, _that.name, _that.clauseIds,
            _that.isDynamaxLegal, _that.isMegaLegal, _that.isTeraLegal);
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
    TResult Function(String id, String name, List<String> clauseIds,
            bool isDynamaxLegal, bool isMegaLegal, bool isTeraLegal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Regulation():
        return $default(_that.id, _that.name, _that.clauseIds,
            _that.isDynamaxLegal, _that.isMegaLegal, _that.isTeraLegal);
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
    TResult? Function(String id, String name, List<String> clauseIds,
            bool isDynamaxLegal, bool isMegaLegal, bool isTeraLegal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Regulation() when $default != null:
        return $default(_that.id, _that.name, _that.clauseIds,
            _that.isDynamaxLegal, _that.isMegaLegal, _that.isTeraLegal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Regulation implements Regulation {
  const _Regulation(
      {required this.id,
      required this.name,
      required final List<String> clauseIds,
      required this.isDynamaxLegal,
      required this.isMegaLegal,
      required this.isTeraLegal})
      : _clauseIds = clauseIds;

  @override
  final String id;
  @override
  final String name;
  final List<String> _clauseIds;
  @override
  List<String> get clauseIds {
    if (_clauseIds is EqualUnmodifiableListView) return _clauseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clauseIds);
  }

  @override
  final bool isDynamaxLegal;
  @override
  final bool isMegaLegal;
  @override
  final bool isTeraLegal;

  /// Create a copy of Regulation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegulationCopyWith<_Regulation> get copyWith =>
      __$RegulationCopyWithImpl<_Regulation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Regulation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._clauseIds, _clauseIds) &&
            (identical(other.isDynamaxLegal, isDynamaxLegal) ||
                other.isDynamaxLegal == isDynamaxLegal) &&
            (identical(other.isMegaLegal, isMegaLegal) ||
                other.isMegaLegal == isMegaLegal) &&
            (identical(other.isTeraLegal, isTeraLegal) ||
                other.isTeraLegal == isTeraLegal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_clauseIds),
      isDynamaxLegal,
      isMegaLegal,
      isTeraLegal);

  @override
  String toString() {
    return 'Regulation(id: $id, name: $name, clauseIds: $clauseIds, isDynamaxLegal: $isDynamaxLegal, isMegaLegal: $isMegaLegal, isTeraLegal: $isTeraLegal)';
  }
}

/// @nodoc
abstract mixin class _$RegulationCopyWith<$Res>
    implements $RegulationCopyWith<$Res> {
  factory _$RegulationCopyWith(
          _Regulation value, $Res Function(_Regulation) _then) =
      __$RegulationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> clauseIds,
      bool isDynamaxLegal,
      bool isMegaLegal,
      bool isTeraLegal});
}

/// @nodoc
class __$RegulationCopyWithImpl<$Res> implements _$RegulationCopyWith<$Res> {
  __$RegulationCopyWithImpl(this._self, this._then);

  final _Regulation _self;
  final $Res Function(_Regulation) _then;

  /// Create a copy of Regulation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? clauseIds = null,
    Object? isDynamaxLegal = null,
    Object? isMegaLegal = null,
    Object? isTeraLegal = null,
  }) {
    return _then(_Regulation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      clauseIds: null == clauseIds
          ? _self._clauseIds
          : clauseIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isDynamaxLegal: null == isDynamaxLegal
          ? _self.isDynamaxLegal
          : isDynamaxLegal // ignore: cast_nullable_to_non_nullable
              as bool,
      isMegaLegal: null == isMegaLegal
          ? _self.isMegaLegal
          : isMegaLegal // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeraLegal: null == isTeraLegal
          ? _self.isTeraLegal
          : isTeraLegal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
