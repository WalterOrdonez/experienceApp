import 'package:flutter_prototype/features/ecommerce/domain/entities/payment_response_entity.dart';

abstract class PaymentRepository {
  /// Procesa el pago con los detalles proporcionados
  Future<PaymentResponseEntity> processPayment({
    required String cardNumber,
    required double amount,
  });
}
