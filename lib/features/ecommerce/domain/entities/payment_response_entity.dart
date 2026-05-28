import 'package:flutter_prototype/features/ecommerce/data/models/payment_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response_entity.freezed.dart';

@freezed
class PaymentResponseEntity with _$PaymentResponseEntity {
  const factory PaymentResponseEntity({
    required bool success,
    required String status,
    required String transactionId,
    required double amount,
    required String currency,
    required String cardLast4,
    required String message,
    required String timestamp,
  }) = _PaymentResponseEntity;

  factory PaymentResponseEntity.fromModel(PaymentResponseModel model) {
    return PaymentResponseEntity(
      success: model.success,
      status: model.status,
      transactionId: model.transactionId,
      amount: model.amount,
      currency: model.currency,
      cardLast4: model.cardLast4,
      message: model.message,
      timestamp: model.timestamp,
    );
  }
}
