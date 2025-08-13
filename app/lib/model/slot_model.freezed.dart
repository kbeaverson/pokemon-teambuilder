// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Slot {
  String get id;
  Pokemon? get pokemon;
  List<MovePoolEntry>? get moves;
  AbilityPoolEntry? get ability;
  Item? get item;
  Nature get nature;
  Map<Stat, int> get ivs;
  Map<Stat, int> get evs;
  PokemonType? get teraType;
  bool get isGigantamax;
  String? get notes;
  bool get isDirty;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SlotCopyWith<Slot> get copyWith =>
      _$SlotCopyWithImpl<Slot>(this as Slot, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Slot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            const DeepCollectionEquality().equals(other.moves, moves) &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.nature, nature) || other.nature == nature) &&
            const DeepCollectionEquality().equals(other.ivs, ivs) &&
            const DeepCollectionEquality().equals(other.evs, evs) &&
            (identical(other.teraType, teraType) ||
                other.teraType == teraType) &&
            (identical(other.isGigantamax, isGigantamax) ||
                other.isGigantamax == isGigantamax) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pokemon,
      const DeepCollectionEquality().hash(moves),
      ability,
      item,
      nature,
      const DeepCollectionEquality().hash(ivs),
      const DeepCollectionEquality().hash(evs),
      teraType,
      isGigantamax,
      notes,
      isDirty);

  @override
  String toString() {
    return 'Slot(id: $id, pokemon: $pokemon, moves: $moves, ability: $ability, item: $item, nature: $nature, ivs: $ivs, evs: $evs, teraType: $teraType, isGigantamax: $isGigantamax, notes: $notes, isDirty: $isDirty)';
  }
}

/// @nodoc
abstract mixin class $SlotCopyWith<$Res> {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) _then) =
      _$SlotCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      Pokemon? pokemon,
      List<MovePoolEntry>? moves,
      AbilityPoolEntry? ability,
      Item? item,
      Nature nature,
      Map<Stat, int> ivs,
      Map<Stat, int> evs,
      PokemonType? teraType,
      bool isGigantamax,
      String? notes,
      bool isDirty});

  $PokemonCopyWith<$Res>? get pokemon;
  $AbilityPoolEntryCopyWith<$Res>? get ability;
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$SlotCopyWithImpl<$Res> implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._self, this._then);

  final Slot _self;
  final $Res Function(Slot) _then;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pokemon = freezed,
    Object? moves = freezed,
    Object? ability = freezed,
    Object? item = freezed,
    Object? nature = null,
    Object? ivs = null,
    Object? evs = null,
    Object? teraType = freezed,
    Object? isGigantamax = null,
    Object? notes = freezed,
    Object? isDirty = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pokemon: freezed == pokemon
          ? _self.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
      moves: freezed == moves
          ? _self.moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<MovePoolEntry>?,
      ability: freezed == ability
          ? _self.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as AbilityPoolEntry?,
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      nature: null == nature
          ? _self.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Nature,
      ivs: null == ivs
          ? _self.ivs
          : ivs // ignore: cast_nullable_to_non_nullable
              as Map<Stat, int>,
      evs: null == evs
          ? _self.evs
          : evs // ignore: cast_nullable_to_non_nullable
              as Map<Stat, int>,
      teraType: freezed == teraType
          ? _self.teraType
          : teraType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      isGigantamax: null == isGigantamax
          ? _self.isGigantamax
          : isGigantamax // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirty: null == isDirty
          ? _self.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonCopyWith<$Res>? get pokemon {
    if (_self.pokemon == null) {
      return null;
    }

    return $PokemonCopyWith<$Res>(_self.pokemon!, (value) {
      return _then(_self.copyWith(pokemon: value));
    });
  }

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AbilityPoolEntryCopyWith<$Res>? get ability {
    if (_self.ability == null) {
      return null;
    }

    return $AbilityPoolEntryCopyWith<$Res>(_self.ability!, (value) {
      return _then(_self.copyWith(ability: value));
    });
  }

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res>? get item {
    if (_self.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_self.item!, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Slot].
extension SlotPatterns on Slot {
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
    TResult Function(_Slot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Slot() when $default != null:
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
    TResult Function(_Slot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Slot():
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
    TResult? Function(_Slot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Slot() when $default != null:
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
            Pokemon? pokemon,
            List<MovePoolEntry>? moves,
            AbilityPoolEntry? ability,
            Item? item,
            Nature nature,
            Map<Stat, int> ivs,
            Map<Stat, int> evs,
            PokemonType? teraType,
            bool isGigantamax,
            String? notes,
            bool isDirty)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Slot() when $default != null:
        return $default(
            _that.id,
            _that.pokemon,
            _that.moves,
            _that.ability,
            _that.item,
            _that.nature,
            _that.ivs,
            _that.evs,
            _that.teraType,
            _that.isGigantamax,
            _that.notes,
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
            Pokemon? pokemon,
            List<MovePoolEntry>? moves,
            AbilityPoolEntry? ability,
            Item? item,
            Nature nature,
            Map<Stat, int> ivs,
            Map<Stat, int> evs,
            PokemonType? teraType,
            bool isGigantamax,
            String? notes,
            bool isDirty)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Slot():
        return $default(
            _that.id,
            _that.pokemon,
            _that.moves,
            _that.ability,
            _that.item,
            _that.nature,
            _that.ivs,
            _that.evs,
            _that.teraType,
            _that.isGigantamax,
            _that.notes,
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
            Pokemon? pokemon,
            List<MovePoolEntry>? moves,
            AbilityPoolEntry? ability,
            Item? item,
            Nature nature,
            Map<Stat, int> ivs,
            Map<Stat, int> evs,
            PokemonType? teraType,
            bool isGigantamax,
            String? notes,
            bool isDirty)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Slot() when $default != null:
        return $default(
            _that.id,
            _that.pokemon,
            _that.moves,
            _that.ability,
            _that.item,
            _that.nature,
            _that.ivs,
            _that.evs,
            _that.teraType,
            _that.isGigantamax,
            _that.notes,
            _that.isDirty);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Slot implements Slot {
  const _Slot(
      {required this.id,
      this.pokemon,
      final List<MovePoolEntry>? moves,
      this.ability,
      this.item,
      this.nature = Nature.docile,
      final Map<Stat, int> ivs = const {
        Stat.hp: 31,
        Stat.atk: 31,
        Stat.def: 31,
        Stat.spa: 31,
        Stat.spd: 31,
        Stat.spe: 31
      },
      final Map<Stat, int> evs = const {
        Stat.hp: 0,
        Stat.atk: 0,
        Stat.def: 0,
        Stat.spa: 0,
        Stat.spd: 0,
        Stat.spe: 0
      },
      this.teraType,
      this.isGigantamax = false,
      this.notes,
      this.isDirty = true})
      : _moves = moves,
        _ivs = ivs,
        _evs = evs;

  @override
  final String id;
  @override
  final Pokemon? pokemon;
  final List<MovePoolEntry>? _moves;
  @override
  List<MovePoolEntry>? get moves {
    final value = _moves;
    if (value == null) return null;
    if (_moves is EqualUnmodifiableListView) return _moves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AbilityPoolEntry? ability;
  @override
  final Item? item;
  @override
  @JsonKey()
  final Nature nature;
  final Map<Stat, int> _ivs;
  @override
  @JsonKey()
  Map<Stat, int> get ivs {
    if (_ivs is EqualUnmodifiableMapView) return _ivs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ivs);
  }

  final Map<Stat, int> _evs;
  @override
  @JsonKey()
  Map<Stat, int> get evs {
    if (_evs is EqualUnmodifiableMapView) return _evs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_evs);
  }

  @override
  final PokemonType? teraType;
  @override
  @JsonKey()
  final bool isGigantamax;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isDirty;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlotCopyWith<_Slot> get copyWith =>
      __$SlotCopyWithImpl<_Slot>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Slot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            const DeepCollectionEquality().equals(other._moves, _moves) &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.nature, nature) || other.nature == nature) &&
            const DeepCollectionEquality().equals(other._ivs, _ivs) &&
            const DeepCollectionEquality().equals(other._evs, _evs) &&
            (identical(other.teraType, teraType) ||
                other.teraType == teraType) &&
            (identical(other.isGigantamax, isGigantamax) ||
                other.isGigantamax == isGigantamax) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pokemon,
      const DeepCollectionEquality().hash(_moves),
      ability,
      item,
      nature,
      const DeepCollectionEquality().hash(_ivs),
      const DeepCollectionEquality().hash(_evs),
      teraType,
      isGigantamax,
      notes,
      isDirty);

  @override
  String toString() {
    return 'Slot(id: $id, pokemon: $pokemon, moves: $moves, ability: $ability, item: $item, nature: $nature, ivs: $ivs, evs: $evs, teraType: $teraType, isGigantamax: $isGigantamax, notes: $notes, isDirty: $isDirty)';
  }
}

/// @nodoc
abstract mixin class _$SlotCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$SlotCopyWith(_Slot value, $Res Function(_Slot) _then) =
      __$SlotCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      Pokemon? pokemon,
      List<MovePoolEntry>? moves,
      AbilityPoolEntry? ability,
      Item? item,
      Nature nature,
      Map<Stat, int> ivs,
      Map<Stat, int> evs,
      PokemonType? teraType,
      bool isGigantamax,
      String? notes,
      bool isDirty});

  @override
  $PokemonCopyWith<$Res>? get pokemon;
  @override
  $AbilityPoolEntryCopyWith<$Res>? get ability;
  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$SlotCopyWithImpl<$Res> implements _$SlotCopyWith<$Res> {
  __$SlotCopyWithImpl(this._self, this._then);

  final _Slot _self;
  final $Res Function(_Slot) _then;

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? pokemon = freezed,
    Object? moves = freezed,
    Object? ability = freezed,
    Object? item = freezed,
    Object? nature = null,
    Object? ivs = null,
    Object? evs = null,
    Object? teraType = freezed,
    Object? isGigantamax = null,
    Object? notes = freezed,
    Object? isDirty = null,
  }) {
    return _then(_Slot(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pokemon: freezed == pokemon
          ? _self.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
      moves: freezed == moves
          ? _self._moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<MovePoolEntry>?,
      ability: freezed == ability
          ? _self.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as AbilityPoolEntry?,
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      nature: null == nature
          ? _self.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Nature,
      ivs: null == ivs
          ? _self._ivs
          : ivs // ignore: cast_nullable_to_non_nullable
              as Map<Stat, int>,
      evs: null == evs
          ? _self._evs
          : evs // ignore: cast_nullable_to_non_nullable
              as Map<Stat, int>,
      teraType: freezed == teraType
          ? _self.teraType
          : teraType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      isGigantamax: null == isGigantamax
          ? _self.isGigantamax
          : isGigantamax // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirty: null == isDirty
          ? _self.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonCopyWith<$Res>? get pokemon {
    if (_self.pokemon == null) {
      return null;
    }

    return $PokemonCopyWith<$Res>(_self.pokemon!, (value) {
      return _then(_self.copyWith(pokemon: value));
    });
  }

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AbilityPoolEntryCopyWith<$Res>? get ability {
    if (_self.ability == null) {
      return null;
    }

    return $AbilityPoolEntryCopyWith<$Res>(_self.ability!, (value) {
      return _then(_self.copyWith(ability: value));
    });
  }

  /// Create a copy of Slot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res>? get item {
    if (_self.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_self.item!, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

// dart format on
