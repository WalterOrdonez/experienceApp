import 'package:flutter_prototype/features/ecommerce/data/datasources/payment_datasource.dart';
import 'package:flutter_prototype/features/ecommerce/data/repositories/payment_repository_imp.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/payment_method_entity.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/payment_response_entity.dart';
import 'package:flutter_prototype/features/ecommerce/domain/usecases/process_payment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'checkout_state.dart';

/// Notifier que maneja la lógica del checkout
class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final ProcessPayment _processPayment;

  CheckoutNotifier(this._processPayment)
    : super(
        const CheckoutState(
          paymentMethods: [
            PaymentMethod(
              id: '1',
              name: 'Mastercard',
              cardNumber: 'xxxx xxxx xxxx 1234',
              type: 'credit_card',
              isSelected: true,
              expirationDate: '12/24',
              cvv: '123',
            ),
            PaymentMethod(
              id: '2',
              name: 'Visa',
              cardNumber: 'xxxx xxxx xxxx 9876',
              type: 'credit_card',
              isSelected: false,
              expirationDate: '11/23',
              cvv: '456',
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

  /// Agrega una nueva tarjeta y la deja seleccionada
  void addPaymentMethod({
    required String cardNumber,
    required String expirationDate,
    required String cvv,
  }) {
    final newPaymentId = state.nextPaymentMethodId.toString();

    final newMethod = PaymentMethod(
      id: newPaymentId,
      name: _resolveCardBrand(cardNumber),
      cardNumber: cardNumber,
      type: 'credit_card',
      isSelected: true,
      expirationDate: expirationDate,
      cvv: cvv,
    );

    state = state.copyWith(
      paymentMethods: [
        ...state.paymentMethods.map((method) {
          return method.copyWith(isSelected: false);
        }),
        newMethod,
      ],
      selectedPaymentId: newPaymentId,
    );
  }

  String _resolveCardBrand(String cardNumberDigits) {
    if (cardNumberDigits.startsWith('4')) {
      return 'Visa';
    }

    if (cardNumberDigits.startsWith('51') ||
        cardNumberDigits.startsWith('52') ||
        cardNumberDigits.startsWith('53') ||
        cardNumberDigits.startsWith('54') ||
        cardNumberDigits.startsWith('55')) {
      return 'Mastercard';
    }

    return 'Card';
  }

  /// Procesa el pago
  Future<PaymentResponseEntity> processPayment(double amount) {
    return _processPayment(
      cardNumber: state.paymentMethods
          .firstWhere((method) => method.isSelected)
          .cardNumber,
      amount: amount,
    );
  }

  void setAmount(double total) {
    state = state.copyWith(amount: total);
  }
}

/// Provider del notifier de checkout
final checkoutProvider = StateNotifierProvider<CheckoutNotifier, CheckoutState>(
  (ref) {
    final dataSource = PaymentDataSource();
    final repository = PaymentRepositoryImp(paymentDataSource: dataSource);
    return CheckoutNotifier(ProcessPayment(repository));
  },
);
