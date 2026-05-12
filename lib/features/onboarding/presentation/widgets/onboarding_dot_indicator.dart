import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget que muestra los indicadores de página (dots) del onboarding
class OnboardingDotIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const OnboardingDotIndicator({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalPages,
        (index) => _buildDot(isActive: index == currentPage),
      ),
    );
  }

  /// Construye un dot individual con animación de tamaño y color
  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      width: isActive ? 10 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.dotInactive,
        shape: BoxShape.circle,
      ),
    );
  }
}
