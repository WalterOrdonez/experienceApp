import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/dot_indicator.dart';

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
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          // Carrusel de banners
          PageView.builder(
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
                              color: AppColors.primary.withValues(alpha: 0.5),
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
          // Dots posicionados en la parte inferior centrados
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
