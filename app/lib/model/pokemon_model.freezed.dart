// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pokemon {
  String get id;
  String get name;
  int get dexNum;
  List<PokemonType> get type;
  bool get isPreEvolution;
  double get weight;
  int get genderRatio;
  bool get isMythical;
  bool get isLegendary;
  bool get isMax;
  bool get isMega;
  String? get mandatoryItemName;
  int get baseHP;
  int get baseAtk;
  int get baseDef;
  int get baseSpA;
  int get baseSpD;
  int get baseSpe;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PokemonCopyWith<Pokemon> get copyWith =>
      _$PokemonCopyWithImpl<Pokemon>(this as Pokemon, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Pokemon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dexNum, dexNum) || other.dexNum == dexNum) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.isPreEvolution, isPreEvolution) ||
                other.isPreEvolution == isPreEvolution) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.genderRatio, genderRatio) ||
                other.genderRatio == genderRatio) &&
            (identical(other.isMythical, isMythical) ||
                other.isMythical == isMythical) &&
            (identical(other.isLegendary, isLegendary) ||
                other.isLegendary == isLegendary) &&
            (identical(other.isMax, isMax) || other.isMax == isMax) &&
            (identical(other.isMega, isMega) || other.isMega == isMega) &&
            (identical(other.mandatoryItemName, mandatoryItemName) ||
                other.mandatoryItemName == mandatoryItemName) &&
            (identical(other.baseHP, baseHP) || other.baseHP == baseHP) &&
            (identical(other.baseAtk, baseAtk) || other.baseAtk == baseAtk) &&
            (identical(other.baseDef, baseDef) || other.baseDef == baseDef) &&
            (identical(other.baseSpA, baseSpA) || other.baseSpA == baseSpA) &&
            (identical(other.baseSpD, baseSpD) || other.baseSpD == baseSpD) &&
            (identical(other.baseSpe, baseSpe) || other.baseSpe == baseSpe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      dexNum,
      const DeepCollectionEquality().hash(type),
      isPreEvolution,
      weight,
      genderRatio,
      isMythical,
      isLegendary,
      isMax,
      isMega,
      mandatoryItemName,
      baseHP,
      baseAtk,
      baseDef,
      baseSpA,
      baseSpD,
      baseSpe);

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, dexNum: $dexNum, type: $type, isPreEvolution: $isPreEvolution, weight: $weight, genderRatio: $genderRatio, isMythical: $isMythical, isLegendary: $isLegendary, isMax: $isMax, isMega: $isMega, mandatoryItemName: $mandatoryItemName, baseHP: $baseHP, baseAtk: $baseAtk, baseDef: $baseDef, baseSpA: $baseSpA, baseSpD: $baseSpD, baseSpe: $baseSpe)';
  }
}

/// @nodoc
abstract mixin class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) _then) =
      _$PokemonCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      int dexNum,
      List<PokemonType> type,
      bool isPreEvolution,
      double weight,
      int genderRatio,
      bool isMythical,
      bool isLegendary,
      bool isMax,
      bool isMega,
      String? mandatoryItemName,
      int baseHP,
      int baseAtk,
      int baseDef,
      int baseSpA,
      int baseSpD,
      int baseSpe});
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res> implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._self, this._then);

  final Pokemon _self;
  final $Res Function(Pokemon) _then;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dexNum = null,
    Object? type = null,
    Object? isPreEvolution = null,
    Object? weight = null,
    Object? genderRatio = null,
    Object? isMythical = null,
    Object? isLegendary = null,
    Object? isMax = null,
    Object? isMega = null,
    Object? mandatoryItemName = freezed,
    Object? baseHP = null,
    Object? baseAtk = null,
    Object? baseDef = null,
    Object? baseSpA = null,
    Object? baseSpD = null,
    Object? baseSpe = null,
  }) {
    return _then(Pokemon(
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
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<PokemonType>,
      isPreEvolution: null == isPreEvolution
          ? _self.isPreEvolution
          : isPreEvolution // ignore: cast_nullable_to_non_nullable
              as bool,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      genderRatio: null == genderRatio
          ? _self.genderRatio
          : genderRatio // ignore: cast_nullable_to_non_nullable
              as int,
      isMythical: null == isMythical
          ? _self.isMythical
          : isMythical // ignore: cast_nullable_to_non_nullable
              as bool,
      isLegendary: null == isLegendary
          ? _self.isLegendary
          : isLegendary // ignore: cast_nullable_to_non_nullable
              as bool,
      isMax: null == isMax
          ? _self.isMax
          : isMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isMega: null == isMega
          ? _self.isMega
          : isMega // ignore: cast_nullable_to_non_nullable
              as bool,
      mandatoryItemName: freezed == mandatoryItemName
          ? _self.mandatoryItemName
          : mandatoryItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      baseHP: null == baseHP
          ? _self.baseHP
          : baseHP // ignore: cast_nullable_to_non_nullable
              as int,
      baseAtk: null == baseAtk
          ? _self.baseAtk
          : baseAtk // ignore: cast_nullable_to_non_nullable
              as int,
      baseDef: null == baseDef
          ? _self.baseDef
          : baseDef // ignore: cast_nullable_to_non_nullable
              as int,
      baseSpA: null == baseSpA
          ? _self.baseSpA
          : baseSpA // ignore: cast_nullable_to_non_nullable
              as int,
      baseSpD: null == baseSpD
          ? _self.baseSpD
          : baseSpD // ignore: cast_nullable_to_non_nullable
              as int,
      baseSpe: null == baseSpe
          ? _self.baseSpe
          : baseSpe // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Pokemon].
extension PokemonPatterns on Pokemon {
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
