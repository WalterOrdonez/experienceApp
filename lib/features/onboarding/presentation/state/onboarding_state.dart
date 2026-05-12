import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/onboarding_image_entity.dart';

part 'onboarding_state.freezed.dart';

/// Estado del onboarding manejado con Freezed
@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(0) int currentImageIndex,
    @Default([]) List<OnboardingImageEntity> images,
  }) = _OnboardingState;
}
