import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_interests_state.freezed.dart';

/// Estado de la selección de intereses en el onboarding
@freezed
class OnboardingInterestsState with _$OnboardingInterestsState {
  const factory OnboardingInterestsState({
    @Default([]) List<String> availableInterests,
    @Default({}) Set<String> selectedInterests,
  }) = _OnboardingInterestsState;
}
