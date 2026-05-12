import '../entities/onboarding_image_entity.dart';

/// Contrato del repositorio de onboarding
abstract class OnboardingRepository {
  List<OnboardingImageEntity> getOnboardingImages();
}
