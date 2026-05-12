import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Vista principal del Ecommerce (placeholder)
class EcommerceView extends StatelessWidget {
  const EcommerceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(child: Text('Ecommerce', style: AppTextStyles.heading)),
    );
  }
}
