import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Carrusel de imágenes promocionales con indicadores de página
class EcommerceBannerCarousel extends StatelessWidget {
  final List<String> images;
  final PageController pageController;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const EcommerceBannerCarousel({
    super.key,
    required this.images,
    required this.pageController,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carrusel de banners
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // Placeholder si la imagen no existe aún
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.primaryLight,
                          child: Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 48,
                              color: AppColors.primary.withOpacity(0.5),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Indicadores de página (dots)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: index == currentIndex ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? AppColors.primary
                    : AppColors.dotInactive,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
