import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../state/onboarding_notifier.dart';
import '../../../../core/widgets/dot_indicator.dart';
import '../widgets/onboarding_image_carousel.dart';

/// Vista principal del onboarding con carrusel de imágenes
class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Navega a la siguiente vista usando el router provider
  void _onNextPressed() {
    ref.read(routerProvider).push(AppRoutes.onboardingNext);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Carrusel de imágenes
              Expanded(
                flex: 3,
                child: OnboardingImageCarousel(
                  images: state.images,
                  pageController: _pageController,
                  onPageChanged: (index) {
                    ref
                        .read(onboardingProvider.notifier)
                        .setCurrentImageIndex(index);
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Indicadores de página (dots)
              DotIndicator(
                totalPages: state.images.length,
                currentPage: state.currentImageIndex,
              ),
              const SizedBox(height: 24),
              // Título fijo
              Text(
                'Create a prototype in just a few minutes',
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 12),
              // Descripción fija
              Text(
                'Enjoy these pre-made components and worry only about creating the best product ever.',
                style: AppTextStyles.body,
              ),
              const Spacer(flex: 1),
              // Botón "Next"
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onNextPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text('Next', style: AppTextStyles.button),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
