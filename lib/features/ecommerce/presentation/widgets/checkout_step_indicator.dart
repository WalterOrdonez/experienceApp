import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Indicador de pasos del checkout
class CheckoutStepIndicator extends StatelessWidget {
  final int currentStep; // 0: Your bag, 1: Shipping, 2: Payment
  final List<String> labels;

  const CheckoutStepIndicator({
    super.key,
    required this.currentStep,
    this.labels = const ['Your bag', 'Shipping', 'Payment'],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: List.generate(labels.length, (index) {
          final isCompleted = index < currentStep;
          final isCurrent = index == currentStep;

          return Expanded(
            child: Row(
              children: [
                const SizedBox(width: 24),
                // Círculo con número o check
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted || isCurrent
                        ? AppColors.primary
                        : AppColors.grey300,
                  ),
                  child: Center(
                    child: isCompleted
                        ? const Icon(
                            Icons.check,
                            color: AppColors.white,
                            size: 20,
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: isCompleted || isCurrent
                                  ? AppColors.white
                                  : AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 8),
                // Label
                Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: isCurrent
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                // Línea conectora (excepto en el último paso)
                if (index < labels.length - 1)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        height: 2,
                        color: isCompleted
                            ? AppColors.primary
                            : AppColors.grey300,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
