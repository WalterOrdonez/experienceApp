import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'onboarding_interests_state.dart';

/// Notifier que maneja la lógica de selección de intereses
class OnboardingInterestsNotifier
    extends StateNotifier<OnboardingInterestsState> {
  OnboardingInterestsNotifier()
    : super(
        const OnboardingInterestsState(
          availableInterests: [
            'User Interface',
            'User Experience',
            'User Research',
            'UX Writing',
            'User Testing',
            'Service Design',
            'Strategy',
            'Design Systems',
          ],
        ),
      );

  /// Alterna la selección de un interés
  void toggleInterest(String interest) {
    final updated = Set<String>.from(state.selectedInterests);
    if (updated.contains(interest)) {
      updated.remove(interest);
    } else {
      updated.add(interest);
    }
    state = state.copyWith(selectedInterests: updated);
  }

  /// Verifica si un interés está seleccionado
  bool isSelected(String interest) {
    return state.selectedInterests.contains(interest);
  }
}

/// Provider del notifier de intereses del onboarding
final onboardingInterestsProvider =
    StateNotifierProvider<
      OnboardingInterestsNotifier,
      OnboardingInterestsState
    >((ref) {
      return OnboardingInterestsNotifier();
    });
