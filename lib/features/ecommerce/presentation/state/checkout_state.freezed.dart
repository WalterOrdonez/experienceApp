// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckoutState {
  int get currentStep =>
      throw _privateConstructorUsedError; // 0: bag, 1: shipping, 2: payment
  List<PaymentMethod> get paymentMethods => throw _privateConstructorUsedError;
  String get selectedPaymentId => throw _privateConstructorUsedError;
  bool get billingAddressSameAsShipping => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
    CheckoutState value,
    $Res Function(CheckoutState) then,
  ) = _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call({
    int currentStep,
    List<PaymentMethod> paymentMethods,
    String selectedPaymentId,
    bool billingAddressSameAsShipping,
    double amount,
  });
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? paymentMethods = null,
    Object? selectedPaymentId = null,
    Object? billingAddressSameAsShipping = null,
    Object? amount = null,
  }) {
    return _then(
      _value.copyWith(
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as int,
            paymentMethods: null == paymentMethods
                ? _value.paymentMethods
                : paymentMethods // ignore: cast_nullable_to_non_nullable
                      as List<PaymentMethod>,
            selectedPaymentId: null == selectedPaymentId
                ? _value.selectedPaymentId
                : selectedPaymentId // ignore: cast_nullable_to_non_nullable
                      as String,
            billingAddressSameAsShipping: null == billingAddressSameAsShipping
                ? _value.billingAddressSameAsShipping
                : billingAddressSameAsShipping // ignore: cast_nullable_to_non_nullable
                      as bool,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
    _$CheckoutStateImpl value,
    $Res Function(_$CheckoutStateImpl) then,
  ) = __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentStep,
    List<PaymentMethod> paymentMethods,
    String selectedPaymentId,
    bool billingAddressSameAsShipping,
    double amount,
  });
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
    _$CheckoutStateImpl _value,
    $Res Function(_$CheckoutStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? paymentMethods = null,
    Object? selectedPaymentId = null,
    Object? billingAddressSameAsShipping = null,
    Object? amount = null,
  }) {
    return _then(
      _$CheckoutStateImpl(
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as int,
        paymentMethods: null == paymentMethods
            ? _value._paymentMethods
            : paymentMethods // ignore: cast_nullable_to_non_nullable
                  as List<PaymentMethod>,
        selectedPaymentId: null == selectedPaymentId
            ? _value.selectedPaymentId
            : selectedPaymentId // ignore: cast_nullable_to_non_nullable
                  as String,
        billingAddressSameAsShipping: null == billingAddressSameAsShipping
            ? _value.billingAddressSameAsShipping
            : billingAddressSameAsShipping // ignore: cast_nullable_to_non_nullable
                  as bool,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutStateImpl implements _CheckoutState {
  const _$CheckoutStateImpl({
    this.currentStep = 2,
    final List<PaymentMethod> paymentMethods = const [],
    this.selectedPaymentId = '',
    this.billingAddressSameAsShipping = true,
    this.amount = 0.0,
  }) : _paymentMethods = paymentMethods;

  @override
  @JsonKey()
  final int currentStep;
  // 0: bag, 1: shipping, 2: payment
  final List<PaymentMethod> _paymentMethods;
  // 0: bag, 1: shipping, 2: payment
  @override
  @JsonKey()
  List<PaymentMethod> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  @override
  @JsonKey()
  final String selectedPaymentId;
  @override
  @JsonKey()
  final bool billingAddressSameAsShipping;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'CheckoutState(currentStep: $currentStep, paymentMethods: $paymentMethods, selectedPaymentId: $selectedPaymentId, billingAddressSameAsShipping: $billingAddressSameAsShipping, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            const DeepCollectionEquality().equals(
              other._paymentMethods,
              _paymentMethods,
            ) &&
            (identical(other.selectedPaymentId, selectedPaymentId) ||
                other.selectedPaymentId == selectedPaymentId) &&
            (identical(
                  other.billingAddressSameAsShipping,
                  billingAddressSameAsShipping,
                ) ||
                other.billingAddressSameAsShipping ==
                    billingAddressSameAsShipping) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStep,
    const DeepCollectionEquality().hash(_paymentMethods),
    selectedPaymentId,
    billingAddressSameAsShipping,
    amount,
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState implements CheckoutState {
  const factory _CheckoutState({
    final int currentStep,
    final List<PaymentMethod> paymentMethods,
    final String selectedPaymentId,
    final bool billingAddressSameAsShipping,
    final double amount,
  }) = _$CheckoutStateImpl;

  @override
  int get currentStep; // 0: bag, 1: shipping, 2: payment
  @override
  List<PaymentMethod> get paymentMethods;
  @override
  String get selectedPaymentId;
  @override
  bool get billingAddressSameAsShipping;
  @override
  double get amount;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
