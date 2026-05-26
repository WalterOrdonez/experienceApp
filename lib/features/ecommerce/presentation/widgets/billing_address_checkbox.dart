import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Fila con checkbox para la dirección de facturación
class BillingAddressCheckbox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onChanged;

  const BillingAddressCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isChecked ? AppColors.primary : AppColors.grey300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isChecked ? AppColors.primary : AppColors.white,
              ),
              child: isChecked
                  ? const Icon(Icons.check, color: AppColors.white, size: 16)
                  : null,
            ),
            const SizedBox(width: 12),
            // Texto
            const Expanded(
              child: Text(
                'My billing address is the same as my shipping address',
                style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
