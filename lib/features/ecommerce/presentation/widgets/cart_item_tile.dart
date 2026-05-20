import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/cart_item_entity.dart';

/// Tile individual de un item en el carrito
class CartItemTile extends StatelessWidget {
  final CartItemEntity item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Imagen del producto
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 80,
            height: 80,
            color: AppColors.primaryLight,
            child: Image.asset(
              item.product.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 32,
                    color: AppColors.primary.withValues(alpha: 0.5),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Info del producto + controles
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre
              Text(
                item.product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              // Color / Talla
              Text(
                '${_colorName(item.selectedColor)} / ${item.selectedSize}',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              // Controles de cantidad + precio
              Row(
                children: [
                  _QuantityButton(icon: Icons.remove, onTap: onDecrement),
                  const SizedBox(width: 12),
                  Text(
                    '${item.quantity}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  _QuantityButton(icon: Icons.add, onTap: onIncrement),
                  const Spacer(),
                  Text(
                    '\$${item.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Convierte un color int a nombre legible
  String _colorName(int colorValue) {
    switch (colorValue) {
      case 0xFF1A1A1A:
        return 'Black';
      case 0xFF007AFF:
        return 'Blue';
      case 0xFFD4AF37:
        return 'Gold';
      case 0xFF4CAF50:
        return 'Green';
      case 0xFF6B6B6B:
        return 'Grey';
      case 0xFFB0B0B0:
        return 'Light Grey';
      default:
        return 'Color';
    }
  }
}

/// Botón circular para controles de cantidad (+ / -)
class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }
}
