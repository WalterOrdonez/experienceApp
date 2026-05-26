import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/dot_indicator.dart';

/// Carrusel de imágenes del producto con botón cerrar y dots
class ProductImageCarousel extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onClose;

  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          // Fondo del carrusel con PageView
          Container(
            height: 300,
            color: AppColors.primaryLight,
            child: PageView.builder(
              itemCount: images.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 48,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Botón cerrar (X)
          Positioned(
            top: 12,
            left: 16,
            child: GestureDetector(
              onTap: onClose,
              child: const Icon(
                Icons.close,
                color: AppColors.textPrimary,
                size: 28,
              ),
            ),
          ),
          // Dots en la parte inferior centrados
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: DotIndicator(
              totalPages: images.length,
              currentPage: currentIndex,
              style: DotIndicatorStyle.circle,
              alignment: MainAxisAlignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
