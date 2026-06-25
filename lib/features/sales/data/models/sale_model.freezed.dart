// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SaleModel _$SaleModelFromJson(Map<String, dynamic> json) {
  return _SaleModel.fromJson(json);
}

/// @nodoc
mixin _$SaleModel {
  double get total => throw _privateConstructorUsedError;

  /// Serializes this SaleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleModelCopyWith<SaleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleModelCopyWith<$Res> {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) then) =
      _$SaleModelCopyWithImpl<$Res, SaleModel>;
  @useResult
  $Res call({double total});
}

/// @nodoc
class _$SaleModelCopyWithImpl<$Res, $Val extends SaleModel>
    implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null}) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SaleModelImplCopyWith<$Res>
    implements $SaleModelCopyWith<$Res> {
  factory _$$SaleModelImplCopyWith(
    _$SaleModelImpl value,
    $Res Function(_$SaleModelImpl) then,
  ) = __$$SaleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double total});
}

/// @nodoc
class __$$SaleModelImplCopyWithImpl<$Res>
    extends _$SaleModelCopyWithImpl<$Res, _$SaleModelImpl>
    implements _$$SaleModelImplCopyWith<$Res> {
  __$$SaleModelImplCopyWithImpl(
    _$SaleModelImpl _value,
    $Res Function(_$SaleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null}) {
    return _then(
      _$SaleModelImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleModelImpl implements _SaleModel {
  const _$SaleModelImpl({required this.total});

  factory _$SaleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleModelImplFromJson(json);

  @override
  final double total;

  @override
  String toString() {
    return 'SaleModel(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleModelImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total);

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleModelImplCopyWith<_$SaleModelImpl> get copyWith =>
      __$$SaleModelImplCopyWithImpl<_$SaleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleModelImplToJson(this);
  }
}

abstract class _SaleModel implements SaleModel {
  const factory _SaleModel({required final double total}) = _$SaleModelImpl;

  factory _SaleModel.fromJson(Map<String, dynamic> json) =
      _$SaleModelImpl.fromJson;

  @override
  double get total;

  /// Create a copy of SaleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleModelImplCopyWith<_$SaleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
