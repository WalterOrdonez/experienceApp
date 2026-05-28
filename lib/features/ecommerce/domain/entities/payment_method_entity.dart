import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_entity.freezed.dart';

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String name,
    required String cardNumber,
    required String type, // 'credit_card', 'apple_pay'
    required bool isSelected,
    required String? expirationDate,
    required String? cvv,
  }) = _PaymentMethod;
}
