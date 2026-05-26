// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_payment_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddPaymentCardState {
  String get cardNumber => throw _privateConstructorUsedError;
  String get expirationDate => throw _privateConstructorUsedError;
  String get cvv => throw _privateConstructorUsedError;

  /// Create a copy of AddPaymentCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPaymentCardStateCopyWith<AddPaymentCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPaymentCardStateCopyWith<$Res> {
  factory $AddPaymentCardStateCopyWith(
    AddPaymentCardState value,
    $Res Function(AddPaymentCardState) then,
  ) = _$AddPaymentCardStateCopyWithImpl<$Res, AddPaymentCardState>;
  @useResult
  $Res call({String cardNumber, String expirationDate, String cvv});
}

/// @nodoc
class _$AddPaymentCardStateCopyWithImpl<$Res, $Val extends AddPaymentCardState>
    implements $AddPaymentCardStateCopyWith<$Res> {
  _$AddPaymentCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPaymentCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? expirationDate = null,
    Object? cvv = null,
  }) {
    return _then(
      _value.copyWith(
            cardNumber: null == cardNumber
                ? _value.cardNumber
                : cardNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            expirationDate: null == expirationDate
                ? _value.expirationDate
                : expirationDate // ignore: cast_nullable_to_non_nullable
                      as String,
            cvv: null == cvv
                ? _value.cvv
                : cvv // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddPaymentCardStateImplCopyWith<$Res>
    implements $AddPaymentCardStateCopyWith<$Res> {
  factory _$$AddPaymentCardStateImplCopyWith(
    _$AddPaymentCardStateImpl value,
    $Res Function(_$AddPaymentCardStateImpl) then,
  ) = __$$AddPaymentCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cardNumber, String expirationDate, String cvv});
}

/// @nodoc
class __$$AddPaymentCardStateImplCopyWithImpl<$Res>
    extends _$AddPaymentCardStateCopyWithImpl<$Res, _$AddPaymentCardStateImpl>
    implements _$$AddPaymentCardStateImplCopyWith<$Res> {
  __$$AddPaymentCardStateImplCopyWithImpl(
    _$AddPaymentCardStateImpl _value,
    $Res Function(_$AddPaymentCardStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddPaymentCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? expirationDate = null,
    Object? cvv = null,
  }) {
    return _then(
      _$AddPaymentCardStateImpl(
        cardNumber: null == cardNumber
            ? _value.cardNumber
            : cardNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        expirationDate: null == expirationDate
            ? _value.expirationDate
            : expirationDate // ignore: cast_nullable_to_non_nullable
                  as String,
        cvv: null == cvv
            ? _value.cvv
            : cvv // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AddPaymentCardStateImpl implements _AddPaymentCardState {
  const _$AddPaymentCardStateImpl({
    this.cardNumber = '',
    this.expirationDate = '',
    this.cvv = '',
  });

  @override
  @JsonKey()
  final String cardNumber;
  @override
  @JsonKey()
  final String expirationDate;
  @override
  @JsonKey()
  final String cvv;

  @override
  String toString() {
    return 'AddPaymentCardState(cardNumber: $cardNumber, expirationDate: $expirationDate, cvv: $cvv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentCardStateImpl &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.cvv, cvv) || other.cvv == cvv));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardNumber, expirationDate, cvv);

  /// Create a copy of AddPaymentCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentCardStateImplCopyWith<_$AddPaymentCardStateImpl> get copyWith =>
      __$$AddPaymentCardStateImplCopyWithImpl<_$AddPaymentCardStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AddPaymentCardState implements AddPaymentCardState {
  const factory _AddPaymentCardState({
    final String cardNumber,
    final String expirationDate,
    final String cvv,
  }) = _$AddPaymentCardStateImpl;

  @override
  String get cardNumber;
  @override
  String get expirationDate;
  @override
  String get cvv;

  /// Create a copy of AddPaymentCardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPaymentCardStateImplCopyWith<_$AddPaymentCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
