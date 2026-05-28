// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentMethod {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'credit_card', 'apple_pay'
  bool get isSelected => throw _privateConstructorUsedError;
  String? get expirationDate => throw _privateConstructorUsedError;
  String? get cvv => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
    PaymentMethod value,
    $Res Function(PaymentMethod) then,
  ) = _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call({
    String id,
    String name,
    String cardNumber,
    String type,
    bool isSelected,
    String? expirationDate,
    String? cvv,
  });
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cardNumber = null,
    Object? type = null,
    Object? isSelected = null,
    Object? expirationDate = freezed,
    Object? cvv = freezed,
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
            cardNumber: null == cardNumber
                ? _value.cardNumber
                : cardNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            isSelected: null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool,
            expirationDate: freezed == expirationDate
                ? _value.expirationDate
                : expirationDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            cvv: freezed == cvv
                ? _value.cvv
                : cvv // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
    _$PaymentMethodImpl value,
    $Res Function(_$PaymentMethodImpl) then,
  ) = __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String cardNumber,
    String type,
    bool isSelected,
    String? expirationDate,
    String? cvv,
  });
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
    _$PaymentMethodImpl _value,
    $Res Function(_$PaymentMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cardNumber = null,
    Object? type = null,
    Object? isSelected = null,
    Object? expirationDate = freezed,
    Object? cvv = freezed,
  }) {
    return _then(
      _$PaymentMethodImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        cardNumber: null == cardNumber
            ? _value.cardNumber
            : cardNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        isSelected: null == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
        expirationDate: freezed == expirationDate
            ? _value.expirationDate
            : expirationDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        cvv: freezed == cvv
            ? _value.cvv
            : cvv // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl({
    required this.id,
    required this.name,
    required this.cardNumber,
    required this.type,
    required this.isSelected,
    required this.expirationDate,
    required this.cvv,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String cardNumber;
  @override
  final String type;
  // 'credit_card', 'apple_pay'
  @override
  final bool isSelected;
  @override
  final String? expirationDate;
  @override
  final String? cvv;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, name: $name, cardNumber: $cardNumber, type: $type, isSelected: $isSelected, expirationDate: $expirationDate, cvv: $cvv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.cvv, cvv) || other.cvv == cvv));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    cardNumber,
    type,
    isSelected,
    expirationDate,
    cvv,
  );

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod({
    required final String id,
    required final String name,
    required final String cardNumber,
    required final String type,
    required final bool isSelected,
    required final String? expirationDate,
    required final String? cvv,
  }) = _$PaymentMethodImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get cardNumber;
  @override
  String get type; // 'credit_card', 'apple_pay'
  @override
  bool get isSelected;
  @override
  String? get expirationDate;
  @override
  String? get cvv;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
