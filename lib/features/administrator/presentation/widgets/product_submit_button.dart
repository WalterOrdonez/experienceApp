import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/core/theme/app_text_styles.dart';

class ProductSubmitButton extends StatelessWidget {
  const ProductSubmitButton({
    super.key,
    required this.isSaving,
    required this.isEditing,
    required this.onPressed,
  });

  final bool isSaving;
  final bool isEditing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isSaving ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isSaving
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Text(
                isEditing ? 'Guardar cambios' : 'Crear producto',
                style: AppTextStyles.button,
              ),
      ),
    );
  }
}
