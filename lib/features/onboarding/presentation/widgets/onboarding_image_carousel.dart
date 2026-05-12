import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/onboarding_image_entity.dart';

/// Carrusel de imágenes del onboarding con PageView
class OnboardingImageCarousel extends StatelessWidget {
  final List<OnboardingImageEntity> images;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const OnboardingImageCarousel({
    super.key,
    required this.images,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(
            child: Icon(
              Icons.image_outlined,
              size: 64,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}
