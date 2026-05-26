import 'package:flutter_prototype/features/ecommerce/domain/entities/payment_method_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.freezed.dart';

/// Estado del checkout
@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(2) int currentStep, // 0: bag, 1: shipping, 2: payment
    @Default([]) List<PaymentMethod> paymentMethods,
    @Default('') String selectedPaymentId,
    @Default(true) bool billingAddressSameAsShipping,
  }) = _CheckoutState;
}
