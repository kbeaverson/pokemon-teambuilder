// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Calculator {
  CalculatorSide get left;
  CalculatorSide get right;
  Move? get attackingMove;
  bool get criticalHit;
  bool get guaranteedCrit;
  SideName? get attacker;
  String? get resultString;
  List<int>? get damageRange;
  Weather? get weather;
  Terrain? get terrain;
  bool get gravity;
  bool get neutralizingGas;
  bool get swordOfRuin;
  bool get beadsOfRuin;
  bool get tabletsOfRuin;
  bool get vesselOfRuin;
  bool get auraBreak;
  bool get darkAura;
  bool get fairyAura;

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalculatorCopyWith<Calculator> get copyWith =>
      _$CalculatorCopyWithImpl<Calculator>(this as Calculator, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Calculator &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.right, right) || other.right == right) &&
            (identical(other.attackingMove, attackingMove) ||
                other.attackingMove == attackingMove) &&
            (identical(other.criticalHit, criticalHit) ||
                other.criticalHit == criticalHit) &&
            (identical(other.guaranteedCrit, guaranteedCrit) ||
                other.guaranteedCrit == guaranteedCrit) &&
            (identical(other.attacker, attacker) ||
                other.attacker == attacker) &&
            (identical(other.resultString, resultString) ||
                other.resultString == resultString) &&
            const DeepCollectionEquality()
                .equals(other.damageRange, damageRange) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.terrain, terrain) || other.terrain == terrain) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.neutralizingGas, neutralizingGas) ||
                other.neutralizingGas == neutralizingGas) &&
            (identical(other.swordOfRuin, swordOfRuin) ||
                other.swordOfRuin == swordOfRuin) &&
            (identical(other.beadsOfRuin, beadsOfRuin) ||
                other.beadsOfRuin == beadsOfRuin) &&
            (identical(other.tabletsOfRuin, tabletsOfRuin) ||
                other.tabletsOfRuin == tabletsOfRuin) &&
            (identical(other.vesselOfRuin, vesselOfRuin) ||
                other.vesselOfRuin == vesselOfRuin) &&
            (identical(other.auraBreak, auraBreak) ||
                other.auraBreak == auraBreak) &&
            (identical(other.darkAura, darkAura) ||
                other.darkAura == darkAura) &&
            (identical(other.fairyAura, fairyAura) ||
                other.fairyAura == fairyAura));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        left,
        right,
        attackingMove,
        criticalHit,
        guaranteedCrit,
        attacker,
        resultString,
        const DeepCollectionEquality().hash(damageRange),
        weather,
        terrain,
        gravity,
        neutralizingGas,
        swordOfRuin,
        beadsOfRuin,
        tabletsOfRuin,
        vesselOfRuin,
        auraBreak,
        darkAura,
        fairyAura
      ]);

  @override
  String toString() {
    return 'Calculator(left: $left, right: $right, attackingMove: $attackingMove, criticalHit: $criticalHit, guaranteedCrit: $guaranteedCrit, attacker: $attacker, resultString: $resultString, damageRange: $damageRange, weather: $weather, terrain: $terrain, gravity: $gravity, neutralizingGas: $neutralizingGas, swordOfRuin: $swordOfRuin, beadsOfRuin: $beadsOfRuin, tabletsOfRuin: $tabletsOfRuin, vesselOfRuin: $vesselOfRuin, auraBreak: $auraBreak, darkAura: $darkAura, fairyAura: $fairyAura)';
  }
}

/// @nodoc
abstract mixin class $CalculatorCopyWith<$Res> {
  factory $CalculatorCopyWith(
          Calculator value, $Res Function(Calculator) _then) =
      _$CalculatorCopyWithImpl;
  @useResult
  $Res call(
      {CalculatorSide left,
      CalculatorSide right,
      Move? attackingMove,
      bool criticalHit,
      bool guaranteedCrit,
      SideName? attacker,
      String? resultString,
      List<int>? damageRange,
      Weather? weather,
      Terrain? terrain,
      bool gravity,
      bool neutralizingGas,
      bool swordOfRuin,
      bool beadsOfRuin,
      bool tabletsOfRuin,
      bool vesselOfRuin,
      bool auraBreak,
      bool darkAura,
      bool fairyAura});

  $CalculatorSideCopyWith<$Res> get left;
  $CalculatorSideCopyWith<$Res> get right;
  $MoveCopyWith<$Res>? get attackingMove;
}

/// @nodoc
class _$CalculatorCopyWithImpl<$Res> implements $CalculatorCopyWith<$Res> {
  _$CalculatorCopyWithImpl(this._self, this._then);

  final Calculator _self;
  final $Res Function(Calculator) _then;

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? right = null,
    Object? attackingMove = freezed,
    Object? criticalHit = null,
    Object? guaranteedCrit = null,
    Object? attacker = freezed,
    Object? resultString = freezed,
    Object? damageRange = freezed,
    Object? weather = freezed,
    Object? terrain = freezed,
    Object? gravity = null,
    Object? neutralizingGas = null,
    Object? swordOfRuin = null,
    Object? beadsOfRuin = null,
    Object? tabletsOfRuin = null,
    Object? vesselOfRuin = null,
    Object? auraBreak = null,
    Object? darkAura = null,
    Object? fairyAura = null,
  }) {
    return _then(_self.copyWith(
      left: null == left
          ? _self.left
          : left // ignore: cast_nullable_to_non_nullable
              as CalculatorSide,
      right: null == right
          ? _self.right
          : right // ignore: cast_nullable_to_non_nullable
              as CalculatorSide,
      attackingMove: freezed == attackingMove
          ? _self.attackingMove
          : attackingMove // ignore: cast_nullable_to_non_nullable
              as Move?,
      criticalHit: null == criticalHit
          ? _self.criticalHit
          : criticalHit // ignore: cast_nullable_to_non_nullable
              as bool,
      guaranteedCrit: null == guaranteedCrit
          ? _self.guaranteedCrit
          : guaranteedCrit // ignore: cast_nullable_to_non_nullable
              as bool,
      attacker: freezed == attacker
          ? _self.attacker
          : attacker // ignore: cast_nullable_to_non_nullable
              as SideName?,
      resultString: freezed == resultString
          ? _self.resultString
          : resultString // ignore: cast_nullable_to_non_nullable
              as String?,
      damageRange: freezed == damageRange
          ? _self.damageRange
          : damageRange // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      weather: freezed == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      terrain: freezed == terrain
          ? _self.terrain
          : terrain // ignore: cast_nullable_to_non_nullable
              as Terrain?,
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as bool,
      neutralizingGas: null == neutralizingGas
          ? _self.neutralizingGas
          : neutralizingGas // ignore: cast_nullable_to_non_nullable
              as bool,
      swordOfRuin: null == swordOfRuin
          ? _self.swordOfRuin
          : swordOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      beadsOfRuin: null == beadsOfRuin
          ? _self.beadsOfRuin
          : beadsOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      tabletsOfRuin: null == tabletsOfRuin
          ? _self.tabletsOfRuin
          : tabletsOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      vesselOfRuin: null == vesselOfRuin
          ? _self.vesselOfRuin
          : vesselOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      auraBreak: null == auraBreak
          ? _self.auraBreak
          : auraBreak // ignore: cast_nullable_to_non_nullable
              as bool,
      darkAura: null == darkAura
          ? _self.darkAura
          : darkAura // ignore: cast_nullable_to_non_nullable
              as bool,
      fairyAura: null == fairyAura
          ? _self.fairyAura
          : fairyAura // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculatorSideCopyWith<$Res> get left {
    return $CalculatorSideCopyWith<$Res>(_self.left, (value) {
      return _then(_self.copyWith(left: value));
    });
  }

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculatorSideCopyWith<$Res> get right {
    return $CalculatorSideCopyWith<$Res>(_self.right, (value) {
      return _then(_self.copyWith(right: value));
    });
  }

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoveCopyWith<$Res>? get attackingMove {
    if (_self.attackingMove == null) {
      return null;
    }

    return $MoveCopyWith<$Res>(_self.attackingMove!, (value) {
      return _then(_self.copyWith(attackingMove: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Calculator].
extension CalculatorPatterns on Calculator {
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
    TResult Function(_Calculator value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Calculator() when $default != null:
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
    TResult Function(_Calculator value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Calculator():
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
    TResult? Function(_Calculator value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Calculator() when $default != null:
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
            CalculatorSide left,
            CalculatorSide right,
            Move? attackingMove,
            bool criticalHit,
            bool guaranteedCrit,
            SideName? attacker,
            String? resultString,
            List<int>? damageRange,
            Weather? weather,
            Terrain? terrain,
            bool gravity,
            bool neutralizingGas,
            bool swordOfRuin,
            bool beadsOfRuin,
            bool tabletsOfRuin,
            bool vesselOfRuin,
            bool auraBreak,
            bool darkAura,
            bool fairyAura)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Calculator() when $default != null:
        return $default(
            _that.left,
            _that.right,
            _that.attackingMove,
            _that.criticalHit,
            _that.guaranteedCrit,
            _that.attacker,
            _that.resultString,
            _that.damageRange,
            _that.weather,
            _that.terrain,
            _that.gravity,
            _that.neutralizingGas,
            _that.swordOfRuin,
            _that.beadsOfRuin,
            _that.tabletsOfRuin,
            _that.vesselOfRuin,
            _that.auraBreak,
            _that.darkAura,
            _that.fairyAura);
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
            CalculatorSide left,
            CalculatorSide right,
            Move? attackingMove,
            bool criticalHit,
            bool guaranteedCrit,
            SideName? attacker,
            String? resultString,
            List<int>? damageRange,
            Weather? weather,
            Terrain? terrain,
            bool gravity,
            bool neutralizingGas,
            bool swordOfRuin,
            bool beadsOfRuin,
            bool tabletsOfRuin,
            bool vesselOfRuin,
            bool auraBreak,
            bool darkAura,
            bool fairyAura)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Calculator():
        return $default(
            _that.left,
            _that.right,
            _that.attackingMove,
            _that.criticalHit,
            _that.guaranteedCrit,
            _that.attacker,
            _that.resultString,
            _that.damageRange,
            _that.weather,
            _that.terrain,
            _that.gravity,
            _that.neutralizingGas,
            _that.swordOfRuin,
            _that.beadsOfRuin,
            _that.tabletsOfRuin,
            _that.vesselOfRuin,
            _that.auraBreak,
            _that.darkAura,
            _that.fairyAura);
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
            CalculatorSide left,
            CalculatorSide right,
            Move? attackingMove,
            bool criticalHit,
            bool guaranteedCrit,
            SideName? attacker,
            String? resultString,
            List<int>? damageRange,
            Weather? weather,
            Terrain? terrain,
            bool gravity,
            bool neutralizingGas,
            bool swordOfRuin,
            bool beadsOfRuin,
            bool tabletsOfRuin,
            bool vesselOfRuin,
            bool auraBreak,
            bool darkAura,
            bool fairyAura)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Calculator() when $default != null:
        return $default(
            _that.left,
            _that.right,
            _that.attackingMove,
            _that.criticalHit,
            _that.guaranteedCrit,
            _that.attacker,
            _that.resultString,
            _that.damageRange,
            _that.weather,
            _that.terrain,
            _that.gravity,
            _that.neutralizingGas,
            _that.swordOfRuin,
            _that.beadsOfRuin,
            _that.tabletsOfRuin,
            _that.vesselOfRuin,
            _that.auraBreak,
            _that.darkAura,
            _that.fairyAura);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Calculator implements Calculator {
  const _Calculator(
      {required this.left,
      required this.right,
      this.attackingMove,
      this.criticalHit = false,
      this.guaranteedCrit = false,
      this.attacker,
      this.resultString,
      final List<int>? damageRange,
      this.weather,
      this.terrain,
      this.gravity = false,
      this.neutralizingGas = false,
      this.swordOfRuin = false,
      this.beadsOfRuin = false,
      this.tabletsOfRuin = false,
      this.vesselOfRuin = false,
      this.auraBreak = false,
      this.darkAura = false,
      this.fairyAura = false})
      : _damageRange = damageRange;

  @override
  final CalculatorSide left;
  @override
  final CalculatorSide right;
  @override
  final Move? attackingMove;
  @override
  @JsonKey()
  final bool criticalHit;
  @override
  @JsonKey()
  final bool guaranteedCrit;
  @override
  final SideName? attacker;
  @override
  final String? resultString;
  final List<int>? _damageRange;
  @override
  List<int>? get damageRange {
    final value = _damageRange;
    if (value == null) return null;
    if (_damageRange is EqualUnmodifiableListView) return _damageRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Weather? weather;
  @override
  final Terrain? terrain;
  @override
  @JsonKey()
  final bool gravity;
  @override
  @JsonKey()
  final bool neutralizingGas;
  @override
  @JsonKey()
  final bool swordOfRuin;
  @override
  @JsonKey()
  final bool beadsOfRuin;
  @override
  @JsonKey()
  final bool tabletsOfRuin;
  @override
  @JsonKey()
  final bool vesselOfRuin;
  @override
  @JsonKey()
  final bool auraBreak;
  @override
  @JsonKey()
  final bool darkAura;
  @override
  @JsonKey()
  final bool fairyAura;

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalculatorCopyWith<_Calculator> get copyWith =>
      __$CalculatorCopyWithImpl<_Calculator>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Calculator &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.right, right) || other.right == right) &&
            (identical(other.attackingMove, attackingMove) ||
                other.attackingMove == attackingMove) &&
            (identical(other.criticalHit, criticalHit) ||
                other.criticalHit == criticalHit) &&
            (identical(other.guaranteedCrit, guaranteedCrit) ||
                other.guaranteedCrit == guaranteedCrit) &&
            (identical(other.attacker, attacker) ||
                other.attacker == attacker) &&
            (identical(other.resultString, resultString) ||
                other.resultString == resultString) &&
            const DeepCollectionEquality()
                .equals(other._damageRange, _damageRange) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.terrain, terrain) || other.terrain == terrain) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.neutralizingGas, neutralizingGas) ||
                other.neutralizingGas == neutralizingGas) &&
            (identical(other.swordOfRuin, swordOfRuin) ||
                other.swordOfRuin == swordOfRuin) &&
            (identical(other.beadsOfRuin, beadsOfRuin) ||
                other.beadsOfRuin == beadsOfRuin) &&
            (identical(other.tabletsOfRuin, tabletsOfRuin) ||
                other.tabletsOfRuin == tabletsOfRuin) &&
            (identical(other.vesselOfRuin, vesselOfRuin) ||
                other.vesselOfRuin == vesselOfRuin) &&
            (identical(other.auraBreak, auraBreak) ||
                other.auraBreak == auraBreak) &&
            (identical(other.darkAura, darkAura) ||
                other.darkAura == darkAura) &&
            (identical(other.fairyAura, fairyAura) ||
                other.fairyAura == fairyAura));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        left,
        right,
        attackingMove,
        criticalHit,
        guaranteedCrit,
        attacker,
        resultString,
        const DeepCollectionEquality().hash(_damageRange),
        weather,
        terrain,
        gravity,
        neutralizingGas,
        swordOfRuin,
        beadsOfRuin,
        tabletsOfRuin,
        vesselOfRuin,
        auraBreak,
        darkAura,
        fairyAura
      ]);

  @override
  String toString() {
    return 'Calculator(left: $left, right: $right, attackingMove: $attackingMove, criticalHit: $criticalHit, guaranteedCrit: $guaranteedCrit, attacker: $attacker, resultString: $resultString, damageRange: $damageRange, weather: $weather, terrain: $terrain, gravity: $gravity, neutralizingGas: $neutralizingGas, swordOfRuin: $swordOfRuin, beadsOfRuin: $beadsOfRuin, tabletsOfRuin: $tabletsOfRuin, vesselOfRuin: $vesselOfRuin, auraBreak: $auraBreak, darkAura: $darkAura, fairyAura: $fairyAura)';
  }
}

/// @nodoc
abstract mixin class _$CalculatorCopyWith<$Res>
    implements $CalculatorCopyWith<$Res> {
  factory _$CalculatorCopyWith(
          _Calculator value, $Res Function(_Calculator) _then) =
      __$CalculatorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CalculatorSide left,
      CalculatorSide right,
      Move? attackingMove,
      bool criticalHit,
      bool guaranteedCrit,
      SideName? attacker,
      String? resultString,
      List<int>? damageRange,
      Weather? weather,
      Terrain? terrain,
      bool gravity,
      bool neutralizingGas,
      bool swordOfRuin,
      bool beadsOfRuin,
      bool tabletsOfRuin,
      bool vesselOfRuin,
      bool auraBreak,
      bool darkAura,
      bool fairyAura});

  @override
  $CalculatorSideCopyWith<$Res> get left;
  @override
  $CalculatorSideCopyWith<$Res> get right;
  @override
  $MoveCopyWith<$Res>? get attackingMove;
}

/// @nodoc
class __$CalculatorCopyWithImpl<$Res> implements _$CalculatorCopyWith<$Res> {
  __$CalculatorCopyWithImpl(this._self, this._then);

  final _Calculator _self;
  final $Res Function(_Calculator) _then;

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? left = null,
    Object? right = null,
    Object? attackingMove = freezed,
    Object? criticalHit = null,
    Object? guaranteedCrit = null,
    Object? attacker = freezed,
    Object? resultString = freezed,
    Object? damageRange = freezed,
    Object? weather = freezed,
    Object? terrain = freezed,
    Object? gravity = null,
    Object? neutralizingGas = null,
    Object? swordOfRuin = null,
    Object? beadsOfRuin = null,
    Object? tabletsOfRuin = null,
    Object? vesselOfRuin = null,
    Object? auraBreak = null,
    Object? darkAura = null,
    Object? fairyAura = null,
  }) {
    return _then(_Calculator(
      left: null == left
          ? _self.left
          : left // ignore: cast_nullable_to_non_nullable
              as CalculatorSide,
      right: null == right
          ? _self.right
          : right // ignore: cast_nullable_to_non_nullable
              as CalculatorSide,
      attackingMove: freezed == attackingMove
          ? _self.attackingMove
          : attackingMove // ignore: cast_nullable_to_non_nullable
              as Move?,
      criticalHit: null == criticalHit
          ? _self.criticalHit
          : criticalHit // ignore: cast_nullable_to_non_nullable
              as bool,
      guaranteedCrit: null == guaranteedCrit
          ? _self.guaranteedCrit
          : guaranteedCrit // ignore: cast_nullable_to_non_nullable
              as bool,
      attacker: freezed == attacker
          ? _self.attacker
          : attacker // ignore: cast_nullable_to_non_nullable
              as SideName?,
      resultString: freezed == resultString
          ? _self.resultString
          : resultString // ignore: cast_nullable_to_non_nullable
              as String?,
      damageRange: freezed == damageRange
          ? _self._damageRange
          : damageRange // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      weather: freezed == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      terrain: freezed == terrain
          ? _self.terrain
          : terrain // ignore: cast_nullable_to_non_nullable
              as Terrain?,
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as bool,
      neutralizingGas: null == neutralizingGas
          ? _self.neutralizingGas
          : neutralizingGas // ignore: cast_nullable_to_non_nullable
              as bool,
      swordOfRuin: null == swordOfRuin
          ? _self.swordOfRuin
          : swordOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      beadsOfRuin: null == beadsOfRuin
          ? _self.beadsOfRuin
          : beadsOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      tabletsOfRuin: null == tabletsOfRuin
          ? _self.tabletsOfRuin
          : tabletsOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      vesselOfRuin: null == vesselOfRuin
          ? _self.vesselOfRuin
          : vesselOfRuin // ignore: cast_nullable_to_non_nullable
              as bool,
      auraBreak: null == auraBreak
          ? _self.auraBreak
          : auraBreak // ignore: cast_nullable_to_non_nullable
              as bool,
      darkAura: null == darkAura
          ? _self.darkAura
          : darkAura // ignore: cast_nullable_to_non_nullable
              as bool,
      fairyAura: null == fairyAura
          ? _self.fairyAura
          : fairyAura // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculatorSideCopyWith<$Res> get left {
    return $CalculatorSideCopyWith<$Res>(_self.left, (value) {
      return _then(_self.copyWith(left: value));
    });
  }

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculatorSideCopyWith<$Res> get right {
    return $CalculatorSideCopyWith<$Res>(_self.right, (value) {
      return _then(_self.copyWith(right: value));
    });
  }

  /// Create a copy of Calculator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoveCopyWith<$Res>? get attackingMove {
    if (_self.attackingMove == null) {
      return null;
    }

    return $MoveCopyWith<$Res>(_self.attackingMove!, (value) {
      return _then(_self.copyWith(attackingMove: value));
    });
  }
}

// dart format on
