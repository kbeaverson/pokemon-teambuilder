// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Move {
  String get id;
  String get name;
  int get dexNum;
  List<PokemonType> get type;
  MoveCategory get category;
  MoveTarget get target;
  int get power;
  int get accuracy;
  int get priority;
  int get pp;
  String get shortDescription;
  String get longDescription;
  bool get hasSecondaryEffect;
  bool get isMultiHit;
  int? get multiHitHigh;
  int? get multiHitLow;
  bool get ignoresSubstitute;
  bool get ignoresProtect;
  bool get bounceable;
  bool get bite;
  bool get bullet;
  bool get contact;
  bool get dance;
  bool get heal;
  bool get powder;
  bool get pulse;
  bool get punch;
  bool get slice;
  bool get sound;
  bool get wind;
  bool get boostedBySheerForce;
  bool get ohko;
  bool get isZmove;
  bool get isMaxMove;
  bool get isLegal;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoveCopyWith<Move> get copyWith =>
      _$MoveCopyWithImpl<Move>(this as Move, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Move &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dexNum, dexNum) || other.dexNum == dexNum) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.pp, pp) || other.pp == pp) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.hasSecondaryEffect, hasSecondaryEffect) ||
                other.hasSecondaryEffect == hasSecondaryEffect) &&
            (identical(other.isMultiHit, isMultiHit) ||
                other.isMultiHit == isMultiHit) &&
            (identical(other.multiHitHigh, multiHitHigh) ||
                other.multiHitHigh == multiHitHigh) &&
            (identical(other.multiHitLow, multiHitLow) ||
                other.multiHitLow == multiHitLow) &&
            (identical(other.ignoresSubstitute, ignoresSubstitute) ||
                other.ignoresSubstitute == ignoresSubstitute) &&
            (identical(other.ignoresProtect, ignoresProtect) ||
                other.ignoresProtect == ignoresProtect) &&
            (identical(other.bounceable, bounceable) ||
                other.bounceable == bounceable) &&
            (identical(other.bite, bite) || other.bite == bite) &&
            (identical(other.bullet, bullet) || other.bullet == bullet) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.dance, dance) || other.dance == dance) &&
            (identical(other.heal, heal) || other.heal == heal) &&
            (identical(other.powder, powder) || other.powder == powder) &&
            (identical(other.pulse, pulse) || other.pulse == pulse) &&
            (identical(other.punch, punch) || other.punch == punch) &&
            (identical(other.slice, slice) || other.slice == slice) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.boostedBySheerForce, boostedBySheerForce) ||
                other.boostedBySheerForce == boostedBySheerForce) &&
            (identical(other.ohko, ohko) || other.ohko == ohko) &&
            (identical(other.isZmove, isZmove) || other.isZmove == isZmove) &&
            (identical(other.isMaxMove, isMaxMove) ||
                other.isMaxMove == isMaxMove) &&
            (identical(other.isLegal, isLegal) || other.isLegal == isLegal));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        dexNum,
        const DeepCollectionEquality().hash(type),
        category,
        target,
        power,
        accuracy,
        priority,
        pp,
        shortDescription,
        longDescription,
        hasSecondaryEffect,
        isMultiHit,
        multiHitHigh,
        multiHitLow,
        ignoresSubstitute,
        ignoresProtect,
        bounceable,
        bite,
        bullet,
        contact,
        dance,
        heal,
        powder,
        pulse,
        punch,
        slice,
        sound,
        wind,
        boostedBySheerForce,
        ohko,
        isZmove,
        isMaxMove,
        isLegal
      ]);

  @override
  String toString() {
    return 'Move(id: $id, name: $name, dexNum: $dexNum, type: $type, category: $category, target: $target, power: $power, accuracy: $accuracy, priority: $priority, pp: $pp, shortDescription: $shortDescription, longDescription: $longDescription, hasSecondaryEffect: $hasSecondaryEffect, isMultiHit: $isMultiHit, multiHitHigh: $multiHitHigh, multiHitLow: $multiHitLow, ignoresSubstitute: $ignoresSubstitute, ignoresProtect: $ignoresProtect, bounceable: $bounceable, bite: $bite, bullet: $bullet, contact: $contact, dance: $dance, heal: $heal, powder: $powder, pulse: $pulse, punch: $punch, slice: $slice, sound: $sound, wind: $wind, boostedBySheerForce: $boostedBySheerForce, ohko: $ohko, isZmove: $isZmove, isMaxMove: $isMaxMove, isLegal: $isLegal)';
  }
}

/// @nodoc
abstract mixin class $MoveCopyWith<$Res> {
  factory $MoveCopyWith(Move value, $Res Function(Move) _then) =
      _$MoveCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      int dexNum,
      List<PokemonType> type,
      MoveCategory category,
      MoveTarget target,
      int power,
      int accuracy,
      int priority,
      int pp,
      String shortDescription,
      String longDescription,
      bool hasSecondaryEffect,
      bool isMultiHit,
      int? multiHitHigh,
      int? multiHitLow,
      bool ignoresSubstitute,
      bool ignoresProtect,
      bool bounceable,
      bool bite,
      bool bullet,
      bool contact,
      bool dance,
      bool heal,
      bool powder,
      bool pulse,
      bool punch,
      bool slice,
      bool sound,
      bool wind,
      bool boostedBySheerForce,
      bool ohko,
      bool isZmove,
      bool isMaxMove,
      bool isLegal});
}

/// @nodoc
class _$MoveCopyWithImpl<$Res> implements $MoveCopyWith<$Res> {
  _$MoveCopyWithImpl(this._self, this._then);

  final Move _self;
  final $Res Function(Move) _then;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dexNum = null,
    Object? type = null,
    Object? category = null,
    Object? target = null,
    Object? power = null,
    Object? accuracy = null,
    Object? priority = null,
    Object? pp = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? hasSecondaryEffect = null,
    Object? isMultiHit = null,
    Object? multiHitHigh = freezed,
    Object? multiHitLow = freezed,
    Object? ignoresSubstitute = null,
    Object? ignoresProtect = null,
    Object? bounceable = null,
    Object? bite = null,
    Object? bullet = null,
    Object? contact = null,
    Object? dance = null,
    Object? heal = null,
    Object? powder = null,
    Object? pulse = null,
    Object? punch = null,
    Object? slice = null,
    Object? sound = null,
    Object? wind = null,
    Object? boostedBySheerForce = null,
    Object? ohko = null,
    Object? isZmove = null,
    Object? isMaxMove = null,
    Object? isLegal = null,
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
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<PokemonType>,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as MoveCategory,
      target: null == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as MoveTarget,
      power: null == power
          ? _self.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      pp: null == pp
          ? _self.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as int,
      shortDescription: null == shortDescription
          ? _self.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _self.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      hasSecondaryEffect: null == hasSecondaryEffect
          ? _self.hasSecondaryEffect
          : hasSecondaryEffect // ignore: cast_nullable_to_non_nullable
              as bool,
      isMultiHit: null == isMultiHit
          ? _self.isMultiHit
          : isMultiHit // ignore: cast_nullable_to_non_nullable
              as bool,
      multiHitHigh: freezed == multiHitHigh
          ? _self.multiHitHigh
          : multiHitHigh // ignore: cast_nullable_to_non_nullable
              as int?,
      multiHitLow: freezed == multiHitLow
          ? _self.multiHitLow
          : multiHitLow // ignore: cast_nullable_to_non_nullable
              as int?,
      ignoresSubstitute: null == ignoresSubstitute
          ? _self.ignoresSubstitute
          : ignoresSubstitute // ignore: cast_nullable_to_non_nullable
              as bool,
      ignoresProtect: null == ignoresProtect
          ? _self.ignoresProtect
          : ignoresProtect // ignore: cast_nullable_to_non_nullable
              as bool,
      bounceable: null == bounceable
          ? _self.bounceable
          : bounceable // ignore: cast_nullable_to_non_nullable
              as bool,
      bite: null == bite
          ? _self.bite
          : bite // ignore: cast_nullable_to_non_nullable
              as bool,
      bullet: null == bullet
          ? _self.bullet
          : bullet // ignore: cast_nullable_to_non_nullable
              as bool,
      contact: null == contact
          ? _self.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as bool,
      dance: null == dance
          ? _self.dance
          : dance // ignore: cast_nullable_to_non_nullable
              as bool,
      heal: null == heal
          ? _self.heal
          : heal // ignore: cast_nullable_to_non_nullable
              as bool,
      powder: null == powder
          ? _self.powder
          : powder // ignore: cast_nullable_to_non_nullable
              as bool,
      pulse: null == pulse
          ? _self.pulse
          : pulse // ignore: cast_nullable_to_non_nullable
              as bool,
      punch: null == punch
          ? _self.punch
          : punch // ignore: cast_nullable_to_non_nullable
              as bool,
      slice: null == slice
          ? _self.slice
          : slice // ignore: cast_nullable_to_non_nullable
              as bool,
      sound: null == sound
          ? _self.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as bool,
      wind: null == wind
          ? _self.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as bool,
      boostedBySheerForce: null == boostedBySheerForce
          ? _self.boostedBySheerForce
          : boostedBySheerForce // ignore: cast_nullable_to_non_nullable
              as bool,
      ohko: null == ohko
          ? _self.ohko
          : ohko // ignore: cast_nullable_to_non_nullable
              as bool,
      isZmove: null == isZmove
          ? _self.isZmove
          : isZmove // ignore: cast_nullable_to_non_nullable
              as bool,
      isMaxMove: null == isMaxMove
          ? _self.isMaxMove
          : isMaxMove // ignore: cast_nullable_to_non_nullable
              as bool,
      isLegal: null == isLegal
          ? _self.isLegal
          : isLegal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Move].
extension MovePatterns on Move {
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
    TResult Function(_Move value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
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
    TResult Function(_Move value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move():
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
    TResult? Function(_Move value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
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
            int dexNum,
            List<PokemonType> type,
            MoveCategory category,
            MoveTarget target,
            int power,
            int accuracy,
            int priority,
            int pp,
            String shortDescription,
            String longDescription,
            bool hasSecondaryEffect,
            bool isMultiHit,
            int? multiHitHigh,
            int? multiHitLow,
            bool ignoresSubstitute,
            bool ignoresProtect,
            bool bounceable,
            bool bite,
            bool bullet,
            bool contact,
            bool dance,
            bool heal,
            bool powder,
            bool pulse,
            bool punch,
            bool slice,
            bool sound,
            bool wind,
            bool boostedBySheerForce,
            bool ohko,
            bool isZmove,
            bool isMaxMove,
            bool isLegal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.dexNum,
            _that.type,
            _that.category,
            _that.target,
            _that.power,
            _that.accuracy,
            _that.priority,
            _that.pp,
            _that.shortDescription,
            _that.longDescription,
            _that.hasSecondaryEffect,
            _that.isMultiHit,
            _that.multiHitHigh,
            _that.multiHitLow,
            _that.ignoresSubstitute,
            _that.ignoresProtect,
            _that.bounceable,
            _that.bite,
            _that.bullet,
            _that.contact,
            _that.dance,
            _that.heal,
            _that.powder,
            _that.pulse,
            _that.punch,
            _that.slice,
            _that.sound,
            _that.wind,
            _that.boostedBySheerForce,
            _that.ohko,
            _that.isZmove,
            _that.isMaxMove,
            _that.isLegal);
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
            int dexNum,
            List<PokemonType> type,
            MoveCategory category,
            MoveTarget target,
            int power,
            int accuracy,
            int priority,
            int pp,
            String shortDescription,
            String longDescription,
            bool hasSecondaryEffect,
            bool isMultiHit,
            int? multiHitHigh,
            int? multiHitLow,
            bool ignoresSubstitute,
            bool ignoresProtect,
            bool bounceable,
            bool bite,
            bool bullet,
            bool contact,
            bool dance,
            bool heal,
            bool powder,
            bool pulse,
            bool punch,
            bool slice,
            bool sound,
            bool wind,
            bool boostedBySheerForce,
            bool ohko,
            bool isZmove,
            bool isMaxMove,
            bool isLegal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move():
        return $default(
            _that.id,
            _that.name,
            _that.dexNum,
            _that.type,
            _that.category,
            _that.target,
            _that.power,
            _that.accuracy,
            _that.priority,
            _that.pp,
            _that.shortDescription,
            _that.longDescription,
            _that.hasSecondaryEffect,
            _that.isMultiHit,
            _that.multiHitHigh,
            _that.multiHitLow,
            _that.ignoresSubstitute,
            _that.ignoresProtect,
            _that.bounceable,
            _that.bite,
            _that.bullet,
            _that.contact,
            _that.dance,
            _that.heal,
            _that.powder,
            _that.pulse,
            _that.punch,
            _that.slice,
            _that.sound,
            _that.wind,
            _that.boostedBySheerForce,
            _that.ohko,
            _that.isZmove,
            _that.isMaxMove,
            _that.isLegal);
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
            int dexNum,
            List<PokemonType> type,
            MoveCategory category,
            MoveTarget target,
            int power,
            int accuracy,
            int priority,
            int pp,
            String shortDescription,
            String longDescription,
            bool hasSecondaryEffect,
            bool isMultiHit,
            int? multiHitHigh,
            int? multiHitLow,
            bool ignoresSubstitute,
            bool ignoresProtect,
            bool bounceable,
            bool bite,
            bool bullet,
            bool contact,
            bool dance,
            bool heal,
            bool powder,
            bool pulse,
            bool punch,
            bool slice,
            bool sound,
            bool wind,
            bool boostedBySheerForce,
            bool ohko,
            bool isZmove,
            bool isMaxMove,
            bool isLegal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.dexNum,
            _that.type,
            _that.category,
            _that.target,
            _that.power,
            _that.accuracy,
            _that.priority,
            _that.pp,
            _that.shortDescription,
            _that.longDescription,
            _that.hasSecondaryEffect,
            _that.isMultiHit,
            _that.multiHitHigh,
            _that.multiHitLow,
            _that.ignoresSubstitute,
            _that.ignoresProtect,
            _that.bounceable,
            _that.bite,
            _that.bullet,
            _that.contact,
            _that.dance,
            _that.heal,
            _that.powder,
            _that.pulse,
            _that.punch,
            _that.slice,
            _that.sound,
            _that.wind,
            _that.boostedBySheerForce,
            _that.ohko,
            _that.isZmove,
            _that.isMaxMove,
            _that.isLegal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Move implements Move {
  const _Move(
      {required this.id,
      required this.name,
      required this.dexNum,
      required final List<PokemonType> type,
      required this.category,
      required this.target,
      required this.power,
      required this.accuracy,
      required this.priority,
      required this.pp,
      required this.shortDescription,
      required this.longDescription,
      required this.hasSecondaryEffect,
      required this.isMultiHit,
      this.multiHitHigh,
      this.multiHitLow,
      required this.ignoresSubstitute,
      required this.ignoresProtect,
      required this.bounceable,
      required this.bite,
      required this.bullet,
      required this.contact,
      required this.dance,
      required this.heal,
      required this.powder,
      required this.pulse,
      required this.punch,
      required this.slice,
      required this.sound,
      required this.wind,
      required this.boostedBySheerForce,
      required this.ohko,
      required this.isZmove,
      required this.isMaxMove,
      required this.isLegal})
      : _type = type;

  @override
  final String id;
  @override
  final String name;
  @override
  final int dexNum;
  final List<PokemonType> _type;
  @override
  List<PokemonType> get type {
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_type);
  }

  @override
  final MoveCategory category;
  @override
  final MoveTarget target;
  @override
  final int power;
  @override
  final int accuracy;
  @override
  final int priority;
  @override
  final int pp;
  @override
  final String shortDescription;
  @override
  final String longDescription;
  @override
  final bool hasSecondaryEffect;
  @override
  final bool isMultiHit;
  @override
  final int? multiHitHigh;
  @override
  final int? multiHitLow;
  @override
  final bool ignoresSubstitute;
  @override
  final bool ignoresProtect;
  @override
  final bool bounceable;
  @override
  final bool bite;
  @override
  final bool bullet;
  @override
  final bool contact;
  @override
  final bool dance;
  @override
  final bool heal;
  @override
  final bool powder;
  @override
  final bool pulse;
  @override
  final bool punch;
  @override
  final bool slice;
  @override
  final bool sound;
  @override
  final bool wind;
  @override
  final bool boostedBySheerForce;
  @override
  final bool ohko;
  @override
  final bool isZmove;
  @override
  final bool isMaxMove;
  @override
  final bool isLegal;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoveCopyWith<_Move> get copyWith =>
      __$MoveCopyWithImpl<_Move>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Move &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dexNum, dexNum) || other.dexNum == dexNum) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.pp, pp) || other.pp == pp) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.hasSecondaryEffect, hasSecondaryEffect) ||
                other.hasSecondaryEffect == hasSecondaryEffect) &&
            (identical(other.isMultiHit, isMultiHit) ||
                other.isMultiHit == isMultiHit) &&
            (identical(other.multiHitHigh, multiHitHigh) ||
                other.multiHitHigh == multiHitHigh) &&
            (identical(other.multiHitLow, multiHitLow) ||
                other.multiHitLow == multiHitLow) &&
            (identical(other.ignoresSubstitute, ignoresSubstitute) ||
                other.ignoresSubstitute == ignoresSubstitute) &&
            (identical(other.ignoresProtect, ignoresProtect) ||
                other.ignoresProtect == ignoresProtect) &&
            (identical(other.bounceable, bounceable) ||
                other.bounceable == bounceable) &&
            (identical(other.bite, bite) || other.bite == bite) &&
            (identical(other.bullet, bullet) || other.bullet == bullet) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.dance, dance) || other.dance == dance) &&
            (identical(other.heal, heal) || other.heal == heal) &&
            (identical(other.powder, powder) || other.powder == powder) &&
            (identical(other.pulse, pulse) || other.pulse == pulse) &&
            (identical(other.punch, punch) || other.punch == punch) &&
            (identical(other.slice, slice) || other.slice == slice) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.boostedBySheerForce, boostedBySheerForce) ||
                other.boostedBySheerForce == boostedBySheerForce) &&
            (identical(other.ohko, ohko) || other.ohko == ohko) &&
            (identical(other.isZmove, isZmove) || other.isZmove == isZmove) &&
            (identical(other.isMaxMove, isMaxMove) ||
                other.isMaxMove == isMaxMove) &&
            (identical(other.isLegal, isLegal) || other.isLegal == isLegal));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        dexNum,
        const DeepCollectionEquality().hash(_type),
        category,
        target,
        power,
        accuracy,
        priority,
        pp,
        shortDescription,
        longDescription,
        hasSecondaryEffect,
        isMultiHit,
        multiHitHigh,
        multiHitLow,
        ignoresSubstitute,
        ignoresProtect,
        bounceable,
        bite,
        bullet,
        contact,
        dance,
        heal,
        powder,
        pulse,
        punch,
        slice,
        sound,
        wind,
        boostedBySheerForce,
        ohko,
        isZmove,
        isMaxMove,
        isLegal
      ]);

  @override
  String toString() {
    return 'Move(id: $id, name: $name, dexNum: $dexNum, type: $type, category: $category, target: $target, power: $power, accuracy: $accuracy, priority: $priority, pp: $pp, shortDescription: $shortDescription, longDescription: $longDescription, hasSecondaryEffect: $hasSecondaryEffect, isMultiHit: $isMultiHit, multiHitHigh: $multiHitHigh, multiHitLow: $multiHitLow, ignoresSubstitute: $ignoresSubstitute, ignoresProtect: $ignoresProtect, bounceable: $bounceable, bite: $bite, bullet: $bullet, contact: $contact, dance: $dance, heal: $heal, powder: $powder, pulse: $pulse, punch: $punch, slice: $slice, sound: $sound, wind: $wind, boostedBySheerForce: $boostedBySheerForce, ohko: $ohko, isZmove: $isZmove, isMaxMove: $isMaxMove, isLegal: $isLegal)';
  }
}

/// @nodoc
abstract mixin class _$MoveCopyWith<$Res> implements $MoveCopyWith<$Res> {
  factory _$MoveCopyWith(_Move value, $Res Function(_Move) _then) =
      __$MoveCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int dexNum,
      List<PokemonType> type,
      MoveCategory category,
      MoveTarget target,
      int power,
      int accuracy,
      int priority,
      int pp,
      String shortDescription,
      String longDescription,
      bool hasSecondaryEffect,
      bool isMultiHit,
      int? multiHitHigh,
      int? multiHitLow,
      bool ignoresSubstitute,
      bool ignoresProtect,
      bool bounceable,
      bool bite,
      bool bullet,
      bool contact,
      bool dance,
      bool heal,
      bool powder,
      bool pulse,
      bool punch,
      bool slice,
      bool sound,
      bool wind,
      bool boostedBySheerForce,
      bool ohko,
      bool isZmove,
      bool isMaxMove,
      bool isLegal});
}

/// @nodoc
class __$MoveCopyWithImpl<$Res> implements _$MoveCopyWith<$Res> {
  __$MoveCopyWithImpl(this._self, this._then);

  final _Move _self;
  final $Res Function(_Move) _then;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dexNum = null,
    Object? type = null,
    Object? category = null,
    Object? target = null,
    Object? power = null,
    Object? accuracy = null,
    Object? priority = null,
    Object? pp = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? hasSecondaryEffect = null,
    Object? isMultiHit = null,
    Object? multiHitHigh = freezed,
    Object? multiHitLow = freezed,
    Object? ignoresSubstitute = null,
    Object? ignoresProtect = null,
    Object? bounceable = null,
    Object? bite = null,
    Object? bullet = null,
    Object? contact = null,
    Object? dance = null,
    Object? heal = null,
    Object? powder = null,
    Object? pulse = null,
    Object? punch = null,
    Object? slice = null,
    Object? sound = null,
    Object? wind = null,
    Object? boostedBySheerForce = null,
    Object? ohko = null,
    Object? isZmove = null,
    Object? isMaxMove = null,
    Object? isLegal = null,
  }) {
    return _then(_Move(
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
          ? _self._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<PokemonType>,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as MoveCategory,
      target: null == target
          ? _self.target
          : target // ignore: cast_nullable_to_non_nullable
              as MoveTarget,
      power: null == power
          ? _self.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      pp: null == pp
          ? _self.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as int,
      shortDescription: null == shortDescription
          ? _self.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _self.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      hasSecondaryEffect: null == hasSecondaryEffect
          ? _self.hasSecondaryEffect
          : hasSecondaryEffect // ignore: cast_nullable_to_non_nullable
              as bool,
      isMultiHit: null == isMultiHit
          ? _self.isMultiHit
          : isMultiHit // ignore: cast_nullable_to_non_nullable
              as bool,
      multiHitHigh: freezed == multiHitHigh
          ? _self.multiHitHigh
          : multiHitHigh // ignore: cast_nullable_to_non_nullable
              as int?,
      multiHitLow: freezed == multiHitLow
          ? _self.multiHitLow
          : multiHitLow // ignore: cast_nullable_to_non_nullable
              as int?,
      ignoresSubstitute: null == ignoresSubstitute
          ? _self.ignoresSubstitute
          : ignoresSubstitute // ignore: cast_nullable_to_non_nullable
              as bool,
      ignoresProtect: null == ignoresProtect
          ? _self.ignoresProtect
          : ignoresProtect // ignore: cast_nullable_to_non_nullable
              as bool,
      bounceable: null == bounceable
          ? _self.bounceable
          : bounceable // ignore: cast_nullable_to_non_nullable
              as bool,
      bite: null == bite
          ? _self.bite
          : bite // ignore: cast_nullable_to_non_nullable
              as bool,
      bullet: null == bullet
          ? _self.bullet
          : bullet // ignore: cast_nullable_to_non_nullable
              as bool,
      contact: null == contact
          ? _self.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as bool,
      dance: null == dance
          ? _self.dance
          : dance // ignore: cast_nullable_to_non_nullable
              as bool,
      heal: null == heal
          ? _self.heal
          : heal // ignore: cast_nullable_to_non_nullable
              as bool,
      powder: null == powder
          ? _self.powder
          : powder // ignore: cast_nullable_to_non_nullable
              as bool,
      pulse: null == pulse
          ? _self.pulse
          : pulse // ignore: cast_nullable_to_non_nullable
              as bool,
      punch: null == punch
          ? _self.punch
          : punch // ignore: cast_nullable_to_non_nullable
              as bool,
      slice: null == slice
          ? _self.slice
          : slice // ignore: cast_nullable_to_non_nullable
              as bool,
      sound: null == sound
          ? _self.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as bool,
      wind: null == wind
          ? _self.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as bool,
      boostedBySheerForce: null == boostedBySheerForce
          ? _self.boostedBySheerForce
          : boostedBySheerForce // ignore: cast_nullable_to_non_nullable
              as bool,
      ohko: null == ohko
          ? _self.ohko
          : ohko // ignore: cast_nullable_to_non_nullable
              as bool,
      isZmove: null == isZmove
          ? _self.isZmove
          : isZmove // ignore: cast_nullable_to_non_nullable
              as bool,
      isMaxMove: null == isMaxMove
          ? _self.isMaxMove
          : isMaxMove // ignore: cast_nullable_to_non_nullable
              as bool,
      isLegal: null == isLegal
          ? _self.isLegal
          : isLegal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
