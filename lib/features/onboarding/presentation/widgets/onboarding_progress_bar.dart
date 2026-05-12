import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Barra de progreso lineal para indicar el paso actual del onboarding
class OnboardingProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: currentStep / totalSteps,
        minHeight: 6,
        backgroundColor: AppColors.dotInactive.withOpacity(0.4),
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    );
  }
}
