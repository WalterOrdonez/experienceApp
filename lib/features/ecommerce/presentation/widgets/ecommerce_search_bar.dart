import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Barra de búsqueda con íconos de favoritos y carrito
class EcommerceSearchBar extends StatelessWidget {
  const EcommerceSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Campo de búsqueda
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(Icons.search, color: AppColors.textSecondary, size: 22),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Ícono de favoritos
        _ActionIcon(icon: Icons.favorite_border),
        const SizedBox(width: 8),
        // Ícono de carrito
        _ActionIcon(icon: Icons.shopping_bag_outlined),
      ],
    );
  }
}

/// Ícono de acción circular para la barra de búsqueda
class _ActionIcon extends StatelessWidget {
  final IconData icon;

  const _ActionIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: AppColors.textPrimary, size: 22),
    );
  }
}
