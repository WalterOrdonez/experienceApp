import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'add_payment_card_state.dart';

/// Notifier que maneja la lógica de agregar una tarjeta de pago
class AddPaymentCardNotifier extends StateNotifier<AddPaymentCardState> {
  AddPaymentCardNotifier() : super(const AddPaymentCardState());

  /// Formatea el número de tarjeta con espacios cada 4 dígitos
  String _formatCardNumber(String value) {
    value = value.replaceAll(' ', '');
    if (value.isEmpty) return '';
    final buffer = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      buffer.write(value[i]);
      if ((i + 1) % 4 == 0 && i + 1 != value.length) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }

  /// Formatea la fecha de expiración (MM/YY)
  String _formatExpiration(String value) {
    value = value.replaceAll('/', '');
    if (value.isEmpty) return '';
    if (value.length >= 2) {
      return '${value.substring(0, 2)}/${value.substring(2, value.length)}';
    }
    return value;
  }

  /// Actualiza el número de tarjeta
  void setCardNumber(String value) {
    final formatted = _formatCardNumber(value);
    state = state.copyWith(cardNumber: formatted);
  }

  /// Actualiza la fecha de expiración
  void setExpirationDate(String value) {
    final formatted = _formatExpiration(value);
    state = state.copyWith(expirationDate: formatted);
  }

  /// Actualiza el CVV
  void setCVV(String value) {
    state = state.copyWith(cvv: value);
  }

  /// Guarda la tarjeta
  void saveCard() {
    // TODO: Validar y guardar tarjeta
    // Por ahora es un placeholder
  }

  /// Resetea el formulario
  void reset() {
    state = const AddPaymentCardState();
  }
}

/// Provider del notifier de agregar tarjeta de pago
final addPaymentCardProvider =
    StateNotifierProvider<AddPaymentCardNotifier, AddPaymentCardState>((ref) {
      return AddPaymentCardNotifier();
    });
