import '../../domain/entities/onboarding_image_entity.dart';

/// Fuente de datos local para las imágenes del onboarding
class OnboardingLocalDatasource {
  /// Retorna las imágenes del carrusel del onboarding
  List<OnboardingImageEntity> getImages() {
    return const [
      OnboardingImageEntity(
        imagePath: 'assets/images/onboarding_1.png',
        label: 'Prototype',
      ),
      OnboardingImageEntity(
        imagePath: 'assets/images/onboarding_2.png',
        label: 'Design',
      ),
      OnboardingImageEntity(
        imagePath: 'assets/images/onboarding_3.png',
        label: 'Collaborate',
      ),
    ];
  }
}
