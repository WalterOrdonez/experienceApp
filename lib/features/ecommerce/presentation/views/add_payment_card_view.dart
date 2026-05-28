import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../state/add_payment_card_notifier.dart';
import '../widgets/ecommerce_header.dart';

class AddPaymentCardView extends ConsumerStatefulWidget {
  const AddPaymentCardView({super.key});

  @override
  ConsumerState<AddPaymentCardView> createState() => _AddPaymentCardViewState();
}

class _AddPaymentCardViewState extends ConsumerState<AddPaymentCardView> {
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expirationController;
  late final TextEditingController _cvvController;

  @override
  void initState() {
    super.initState();
    final initialState = ref.read(addPaymentCardProvider);
    _cardNumberController = TextEditingController(
      text: initialState.cardNumber,
    );
    _expirationController = TextEditingController(
      text: initialState.expirationDate,
    );
    _cvvController = TextEditingController(text: initialState.cvv);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expirationController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addPaymentCardProvider);

    if (_cardNumberController.text != state.cardNumber) {
      _cardNumberController.value = TextEditingValue(
        text: state.cardNumber,
        selection: TextSelection.collapsed(offset: state.cardNumber.length),
      );
    }

    if (_expirationController.text != state.expirationDate) {
      _expirationController.value = TextEditingValue(
        text: state.expirationDate,
        selection: TextSelection.collapsed(offset: state.expirationDate.length),
      );
    }

    if (_cvvController.text != state.cvv) {
      _cvvController.value = TextEditingValue(
        text: state.cvv,
        selection: TextSelection.collapsed(offset: state.cvv.length),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const EcommerceHeader(title: 'Add Payment Card'),
            // Contenido scrolleable
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      // Título
                      const Text(
                        'Card Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Campo Número de Tarjeta
                      Text(
                        'Card Number',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                        onChanged: (value) {
                          ref
                              .read(addPaymentCardProvider.notifier)
                              .setCardNumber(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.grey300,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.grey300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Fila con Expiración y CVV
                      Row(
                        children: [
                          // Campo Expiración
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expiration Date',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: _expirationController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                  ],
                                  onChanged: (value) {
                                    ref
                                        .read(addPaymentCardProvider.notifier)
                                        .setExpirationDate(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'MM/YY',
                                    hintStyle: const TextStyle(
                                      color: AppColors.textSecondary,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: AppColors.primary,
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Campo CVV
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CVV',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: _cvvController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  onChanged: (value) {
                                    ref
                                        .read(addPaymentCardProvider.notifier)
                                        .setCVV(value);
                                  },
                                  obscureText: true,
                                  obscuringCharacter: '•',
                                  decoration: InputDecoration(
                                    hintText: '•••',
                                    hintStyle: const TextStyle(
                                      color: AppColors.textSecondary,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: AppColors.primary,
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),
            // Botón "Save Card" fijo en la parte inferior
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final saved = ref
                        .read(addPaymentCardProvider.notifier)
                        .saveCard();

                    if (saved) {
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save Card',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
