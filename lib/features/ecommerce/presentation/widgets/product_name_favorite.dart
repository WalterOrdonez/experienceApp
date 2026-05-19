import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Widget que muestra el nombre del producto con ícono de favorito
class ProductNameFavorite extends StatelessWidget {
  final String name;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ProductNameFavorite({
    super.key,
    required this.name,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: AppTextStyles.heading.copyWith(fontSize: 22),
          ),
        ),
        GestureDetector(
          onTap: onFavoriteTap,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : AppColors.textPrimary,
            size: 26,
          ),
        ),
      ],
    );
  }
}
