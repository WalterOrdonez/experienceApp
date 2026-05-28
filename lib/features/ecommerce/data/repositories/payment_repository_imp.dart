import 'package:flutter_prototype/features/ecommerce/data/datasources/payment_datasource.dart';
import 'package:flutter_prototype/features/ecommerce/data/models/payment_response_model.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/payment_response_entity.dart';
import 'package:flutter_prototype/features/ecommerce/domain/repositories/payment_repository.dart';

class PaymentRepositoryImp implements PaymentRepository {
  final PaymentDataSource paymentDataSource;
  const PaymentRepositoryImp({required this.paymentDataSource});
  @override
  Future<PaymentResponseEntity> processPayment({
    required String cardNumber,
    required double amount,
  }) async {
    PaymentResponseModel paymentResponse = await paymentDataSource
        .processPayment(amount: amount, cardNumber: cardNumber);

    return PaymentResponseEntity.fromModel(paymentResponse);
  }
}
