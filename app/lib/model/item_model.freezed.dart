// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Item {
  String get id;
  String get name;
  int get dexNum;
  int get flingPower;
  bool get ignoredByKlutz;
  List<ItemCategory> get category;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemCopyWith<Item> get copyWith =>
      _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dexNum, dexNum) || other.dexNum == dexNum) &&
            (identical(other.flingPower, flingPower) ||
                other.flingPower == flingPower) &&
            (identical(other.ignoredByKlutz, ignoredByKlutz) ||
                other.ignoredByKlutz == ignoredByKlutz) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, dexNum, flingPower,
      ignoredByKlutz, const DeepCollectionEquality().hash(category));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, dexNum: $dexNum, flingPower: $flingPower, ignoredByKlutz: $ignoredByKlutz, category: $category)';
  }
}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) =
      _$ItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      int dexNum,
      int flingPower,
      bool ignoredByKlutz,
      List<ItemCategory> category});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dexNum = null,
    Object? flingPower = null,
    Object? ignoredByKlutz = null,
    Object? category = null,
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
      flingPower: null == flingPower
          ? _self.flingPower
          : flingPower // ignore: cast_nullable_to_non_nullable
              as int,
      ignoredByKlutz: null == ignoredByKlutz
          ? _self.ignoredByKlutz
          : ignoredByKlutz // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<ItemCategory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Item].
extension ItemPatterns on Item {
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
    TResult Function(_Item value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
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
    TResult Function(_Item value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item():
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
    TResult? Function(_Item value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
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
    TResult Function(String id, String name, int dexNum, int flingPower,
            bool ignoredByKlutz, List<ItemCategory> category)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
        return $default(_that.id, _that.name, _that.dexNum, _that.flingPower,
            _that.ignoredByKlutz, _that.category);
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
    TResult Function(String id, String name, int dexNum, int flingPower,
            bool ignoredByKlutz, List<ItemCategory> category)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item():
        return $default(_that.id, _that.name, _that.dexNum, _that.flingPower,
            _that.ignoredByKlutz, _that.category);
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
    TResult? Function(String id, String name, int dexNum, int flingPower,
            bool ignoredByKlutz, List<ItemCategory> category)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
        return $default(_that.id, _that.name, _that.dexNum, _that.flingPower,
            _that.ignoredByKlutz, _that.category);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Item implements Item {
  const _Item(
      {required this.id,
      required this.name,
      required this.dexNum,
      required this.flingPower,
      required this.ignoredByKlutz,
      required final List<ItemCategory> category})
      : _category = category;

  @override
  final String id;
  @override
  final String name;
  @override
  final int dexNum;
  @override
  final int flingPower;
  @override
  final bool ignoredByKlutz;
  final List<ItemCategory> _category;
  @override
  List<ItemCategory> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dexNum, dexNum) || other.dexNum == dexNum) &&
            (identical(other.flingPower, flingPower) ||
                other.flingPower == flingPower) &&
            (identical(other.ignoredByKlutz, ignoredByKlutz) ||
                other.ignoredByKlutz == ignoredByKlutz) &&
            const DeepCollectionEquality().equals(other._category, _category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, dexNum, flingPower,
      ignoredByKlutz, const DeepCollectionEquality().hash(_category));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, dexNum: $dexNum, flingPower: $flingPower, ignoredByKlutz: $ignoredByKlutz, category: $category)';
  }
}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) =
      __$ItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int dexNum,
      int flingPower,
      bool ignoredByKlutz,
      List<ItemCategory> category});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dexNum = null,
    Object? flingPower = null,
    Object? ignoredByKlutz = null,
    Object? category = null,
  }) {
    return _then(_Item(
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
      flingPower: null == flingPower
          ? _self.flingPower
          : flingPower // ignore: cast_nullable_to_non_nullable
              as int,
      ignoredByKlutz: null == ignoredByKlutz
          ? _self.ignoredByKlutz
          : ignoredByKlutz // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _self._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<ItemCategory>,
    ));
  }
}

// dart format on
