import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Vista siguiente después del onboarding (placeholder)
class OnboardingNextView extends StatelessWidget {
  const OnboardingNextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Personalise your experience',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
