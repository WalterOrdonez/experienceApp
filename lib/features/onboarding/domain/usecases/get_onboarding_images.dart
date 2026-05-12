import '../entities/onboarding_image_entity.dart';
import '../repositories/onboarding_repository.dart';

/// Caso de uso para obtener las imágenes del carrusel del onboarding
class GetOnboardingImages {
  final OnboardingRepository repository;

  const GetOnboardingImages(this.repository);

  List<OnboardingImageEntity> call() {
    return repository.getOnboardingImages();
  }
}
