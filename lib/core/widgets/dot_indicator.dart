import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Indicador de página (dots) reutilizable en toda la aplicación.

class DotIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final DotIndicatorStyle style;
  final MainAxisAlignment alignment;

  const DotIndicator({
    super.key,
    required this.totalPages,
    required this.currentPage,
    this.style = DotIndicatorStyle.circle,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(
        totalPages,
        (index) => _buildDot(isActive: index == currentPage),
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    switch (style) {
      case DotIndicatorStyle.circle:
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
      case DotIndicatorStyle.pill:
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.dotInactive,
            borderRadius: BorderRadius.circular(4),
          ),
        );
    }
  }
}

/// Estilos disponibles para el indicador de dots
enum DotIndicatorStyle {
  /// Dots circulares con cambio de tamaño
  circle,

  /// Dot activo alargado tipo pill
  pill,
}
