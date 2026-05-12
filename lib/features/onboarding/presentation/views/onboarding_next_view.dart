import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../state/onboarding_interests_notifier.dart';
import '../widgets/onboarding_interest_chip.dart';
import '../widgets/onboarding_progress_bar.dart';

/// Vista de personalización de experiencia - selección de intereses
class OnboardingNextView extends ConsumerWidget {
  const OnboardingNextView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingInterestsProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Barra de progreso (paso 1 de 2)
              const OnboardingProgressBar(currentStep: 1, totalSteps: 2),
              const SizedBox(height: 32),
              // Título
              Text(
                'Personalise your\nexperience',
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 8),
              // Subtítulo
              Text('Choose your interests.', style: AppTextStyles.body),
              const SizedBox(height: 24),
              // Lista de intereses scrolleable
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.availableInterests.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final interest = state.availableInterests[index];
                    final isSelected = state.selectedInterests.contains(
                      interest,
                    );
                    return OnboardingInterestChip(
                      label: interest,
                      isSelected: isSelected,
                      onTap: () {
                        ref
                            .read(onboardingInterestsProvider.notifier)
                            .toggleInterest(interest);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Botón "Next"
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onNextPressed(ref),
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

  /// Navega a la vista de Ecommerce si hay al menos un interés seleccionado
  VoidCallback? _onNextPressed(WidgetRef ref) {
    final state = ref.read(onboardingInterestsProvider);
    if (state.selectedInterests.isEmpty) return null;
    return () {
      ref.read(routerProvider).push(AppRoutes.ecommerce);
    };
  }
}
