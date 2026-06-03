import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/navigation/app_router.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/state/checkout_notifier.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/widgets/billing_address_checkbox.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/widgets/checkout_step_indicator.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/widgets/ecommerce_header.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/widgets/payment_method_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutView extends ConsumerWidget {
  const CheckoutView({super.key});

  Future<void> _handleProcessPayment(
    BuildContext context,
    WidgetRef ref,
    double amount,
  ) async {
    try {
      final response = await ref
          .read(checkoutProvider.notifier)
          .processPayment(amount);

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          backgroundColor: response.success ? Colors.green : Colors.red,
        ),
      );
    } catch (_error) {
      if (!context.mounted) return;
      print('Error al procesar el pago: $_error');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo procesar el pago. Intenta nuevamente.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header con botón atrás y título
            const EcommerceHeader(title: 'Checkout'),
            // Step indicator
            CheckoutStepIndicator(currentStep: state.currentStep),
            // Contenido scrolleable
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      // Título "Choose a payment method"
                      const Text(
                        'Choose a payment method',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Subtítulo
                      const Text(
                        "You won't be charged until you review the order on the next page",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Métodos de pago
                      ...state.paymentMethods.map((method) {
                        return PaymentMethodCard(
                          name: method.name,
                          cardNumber: method.cardNumber,
                          isSelected: method.isSelected,
                          onSelect: () {
                            ref
                                .read(checkoutProvider.notifier)
                                .selectPaymentMethod(method.id);
                          },
                        );
                      }),
                      const SizedBox(height: 16),
                      // Botón "Add new card"
                      Center(
                        child: TextButton.icon(
                          onPressed: () {
                            ref
                                .read(routerProvider)
                                .push(AppRoutes.addPaymentCard);
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Add new card'),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Checkbox dirección de facturación
                      BillingAddressCheckbox(
                        isChecked: state.billingAddressSameAsShipping,
                        onChanged: () {
                          ref
                              .read(checkoutProvider.notifier)
                              .toggleBillingAddressSameAsShipping();
                        },
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
            // Botón "Process Payment" fijo en la parte inferior
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await _handleProcessPayment(context, ref, state.amount);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Process Payment',
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
