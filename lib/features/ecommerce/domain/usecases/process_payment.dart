import 'package:flutter_prototype/features/ecommerce/domain/entities/payment_response_entity.dart';
import 'package:flutter_prototype/features/ecommerce/domain/repositories/payment_repository.dart';

class ProcessPayment {
  final PaymentRepository repository;

  ProcessPayment(this.repository);

  Future<PaymentResponseEntity> call({
    required String cardNumber,
    required double amount,
  }) async {
    return await repository.processPayment(
      cardNumber: cardNumber,
      amount: amount,
    );
  }
}
