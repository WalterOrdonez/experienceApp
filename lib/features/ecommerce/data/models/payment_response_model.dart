import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response_model.freezed.dart';

@freezed
class PaymentResponseModel with _$PaymentResponseModel {
  const factory PaymentResponseModel({
    required bool success,
    required String status,
    required String transactionId,
    required double amount,
    required String currency,
    required String cardLast4,
    required String message,
    required String timestamp,
  }) = _PaymentResponseModel;

  static Future<PaymentResponseModel> fromJson(
    Map<String, dynamic> json,
  ) async {
    return PaymentResponseModel(
      success: json['success'],
      status: json['status'],
      transactionId: json['transactionId'],
      amount: json['amount'].toDouble(),
      currency: json['currency'],
      cardLast4: json['cardLast4'],
      message: json['message'],
      timestamp: json['timestamp'],
    );
  }
}
