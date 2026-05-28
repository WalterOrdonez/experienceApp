// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get cardLast4 => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentResponseModelCopyWith<PaymentResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResponseModelCopyWith<$Res> {
  factory $PaymentResponseModelCopyWith(
    PaymentResponseModel value,
    $Res Function(PaymentResponseModel) then,
  ) = _$PaymentResponseModelCopyWithImpl<$Res, PaymentResponseModel>;
  @useResult
  $Res call({
    bool success,
    String status,
    String transactionId,
    double amount,
    String currency,
    String cardLast4,
    String message,
    String timestamp,
  });
}

/// @nodoc
class _$PaymentResponseModelCopyWithImpl<
  $Res,
  $Val extends PaymentResponseModel
>
    implements $PaymentResponseModelCopyWith<$Res> {
  _$PaymentResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? transactionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? cardLast4 = null,
    Object? message = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            transactionId: null == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            cardLast4: null == cardLast4
                ? _value.cardLast4
                : cardLast4 // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentResponseModelImplCopyWith<$Res>
    implements $PaymentResponseModelCopyWith<$Res> {
  factory _$$PaymentResponseModelImplCopyWith(
    _$PaymentResponseModelImpl value,
    $Res Function(_$PaymentResponseModelImpl) then,
  ) = __$$PaymentResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String status,
    String transactionId,
    double amount,
    String currency,
    String cardLast4,
    String message,
    String timestamp,
  });
}

/// @nodoc
class __$$PaymentResponseModelImplCopyWithImpl<$Res>
    extends _$PaymentResponseModelCopyWithImpl<$Res, _$PaymentResponseModelImpl>
    implements _$$PaymentResponseModelImplCopyWith<$Res> {
  __$$PaymentResponseModelImplCopyWithImpl(
    _$PaymentResponseModelImpl _value,
    $Res Function(_$PaymentResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? transactionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? cardLast4 = null,
    Object? message = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$PaymentResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        transactionId: null == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        cardLast4: null == cardLast4
            ? _value.cardLast4
            : cardLast4 // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PaymentResponseModelImpl implements _PaymentResponseModel {
  const _$PaymentResponseModelImpl({
    required this.success,
    required this.status,
    required this.transactionId,
    required this.amount,
    required this.currency,
    required this.cardLast4,
    required this.message,
    required this.timestamp,
  });

  @override
  final bool success;
  @override
  final String status;
  @override
  final String transactionId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String cardLast4;
  @override
  final String message;
  @override
  final String timestamp;

  @override
  String toString() {
    return 'PaymentResponseModel(success: $success, status: $status, transactionId: $transactionId, amount: $amount, currency: $currency, cardLast4: $cardLast4, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.cardLast4, cardLast4) ||
                other.cardLast4 == cardLast4) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    status,
    transactionId,
    amount,
    currency,
    cardLast4,
    message,
    timestamp,
  );

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResponseModelImplCopyWith<_$PaymentResponseModelImpl>
  get copyWith =>
      __$$PaymentResponseModelImplCopyWithImpl<_$PaymentResponseModelImpl>(
        this,
        _$identity,
      );
}

abstract class _PaymentResponseModel implements PaymentResponseModel {
  const factory _PaymentResponseModel({
    required final bool success,
    required final String status,
    required final String transactionId,
    required final double amount,
    required final String currency,
    required final String cardLast4,
    required final String message,
    required final String timestamp,
  }) = _$PaymentResponseModelImpl;

  @override
  bool get success;
  @override
  String get status;
  @override
  String get transactionId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get cardLast4;
  @override
  String get message;
  @override
  String get timestamp;

  /// Create a copy of PaymentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentResponseModelImplCopyWith<_$PaymentResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
