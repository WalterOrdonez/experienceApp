import 'package:flutter_prototype/features/ecommerce/domain/entities/payment_method_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'checkout_state.dart';

/// Notifier que maneja la lógica del checkout
class CheckoutNotifier extends StateNotifier<CheckoutState> {
  CheckoutNotifier()
    : super(
        const CheckoutState(
          paymentMethods: [
            PaymentMethod(
              id: '1',
              name: 'Mastercard',
              cardNumber: 'xxxx xxxx xxxx 1234',
              type: 'credit_card',
              isSelected: true,
            ),
            PaymentMethod(
              id: '2',
              name: 'Visa',
              cardNumber: 'xxxx xxxx xxxx 9876',
              type: 'credit_card',
              isSelected: false,
            ),
            PaymentMethod(
              id: '3',
              name: 'Apple Pay',
              cardNumber: '',
              type: 'apple_pay',
              isSelected: false,
            ),
          ],
          selectedPaymentId: '1',
        ),
      );

  /// Selecciona un método de pago
  void selectPaymentMethod(String paymentId) {
    state = state.copyWith(
      paymentMethods: state.paymentMethods.map((method) {
        return method.copyWith(isSelected: method.id == paymentId);
      }).toList(),
      selectedPaymentId: paymentId,
    );
  }

  /// Alterna si la dirección de facturación es igual a la de envío
  void toggleBillingAddressSameAsShipping() {
    state = state.copyWith(
      billingAddressSameAsShipping: !state.billingAddressSameAsShipping,
    );
  }

  /// Procesa el pago
  void processPayment() {
    // Lógica para procesar el pago (por ahora solo es un placeholder)
    // En un caso real, aquí iría la integración con la API de pagos
  }
}

/// Provider del notifier de checkout
final checkoutProvider = StateNotifierProvider<CheckoutNotifier, CheckoutState>(
  (ref) {
    return CheckoutNotifier();
  },
);
