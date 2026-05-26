import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_card_state.freezed.dart';

/// Estado para agregar una nueva tarjeta de pago
@freezed
class AddPaymentCardState with _$AddPaymentCardState {
  const factory AddPaymentCardState({
    @Default('') String cardNumber,
    @Default('') String expirationDate,
    @Default('') String cvv,
  }) = _AddPaymentCardState;
}
