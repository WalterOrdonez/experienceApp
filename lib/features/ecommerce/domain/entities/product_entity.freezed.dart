// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProductEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<String> get size => throw _privateConstructorUsedError;
  List<int> get color => throw _privateConstructorUsedError;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
    ProductEntity value,
    $Res Function(ProductEntity) then,
  ) = _$ProductEntityCopyWithImpl<$Res, ProductEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String imagePath,
    double price,
    List<String> size,
    List<int> color,
  });
}

/// @nodoc
class _$ProductEntityCopyWithImpl<$Res, $Val extends ProductEntity>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? price = null,
    Object? size = null,
    Object? color = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            imagePath: null == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductEntityImplCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$$ProductEntityImplCopyWith(
    _$ProductEntityImpl value,
    $Res Function(_$ProductEntityImpl) then,
  ) = __$$ProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String imagePath,
    double price,
    List<String> size,
    List<int> color,
  });
}

/// @nodoc
class __$$ProductEntityImplCopyWithImpl<$Res>
    extends _$ProductEntityCopyWithImpl<$Res, _$ProductEntityImpl>
    implements _$$ProductEntityImplCopyWith<$Res> {
  __$$ProductEntityImplCopyWithImpl(
    _$ProductEntityImpl _value,
    $Res Function(_$ProductEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? price = null,
    Object? size = null,
    Object? color = null,
  }) {
    return _then(
      _$ProductEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        imagePath: null == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        size: null == size
            ? _value._size
            : size // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        color: null == color
            ? _value._color
            : color // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc

class _$ProductEntityImpl extends _ProductEntity {
  const _$ProductEntityImpl({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required final List<String> size,
    required final List<int> color,
  }) : _size = size,
       _color = color,
       super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String imagePath;
  @override
  final double price;
  final List<String> _size;
  @override
  List<String> get size {
    if (_size is EqualUnmodifiableListView) return _size;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_size);
  }

  final List<int> _color;
  @override
  List<int> get color {
    if (_color is EqualUnmodifiableListView) return _color;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_color);
  }

  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, imagePath: $imagePath, price: $price, size: $size, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._size, _size) &&
            const DeepCollectionEquality().equals(other._color, _color));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    imagePath,
    price,
    const DeepCollectionEquality().hash(_size),
    const DeepCollectionEquality().hash(_color),
  );

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      __$$ProductEntityImplCopyWithImpl<_$ProductEntityImpl>(this, _$identity);
}

abstract class _ProductEntity extends ProductEntity {
  const factory _ProductEntity({
    required final String id,
    required final String name,
    required final String imagePath,
    required final double price,
    required final List<String> size,
    required final List<int> color,
  }) = _$ProductEntityImpl;
  const _ProductEntity._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get imagePath;
  @override
  double get price;
  @override
  List<String> get size;
  @override
  List<int> get color;

  /// Create a copy of ProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
