import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Selector de colores con círculos y check de selección
class ProductColorSelector extends StatelessWidget {
  final List<int> colors;
  final int selectedIndex;
  final ValueChanged<int> onColorSelected;

  const ProductColorSelector({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(colors.length, (index) {
            final isSelected = index == selectedIndex;
            final color = Color(colors[index]);
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => onColorSelected(index),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Círculo de color
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: AppColors.primary, width: 2)
                            : null,
                      ),
                    ),
                    // Check de selección
                    if (isSelected)
                      Icon(Icons.check, color: AppColors.primary, size: 18),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
