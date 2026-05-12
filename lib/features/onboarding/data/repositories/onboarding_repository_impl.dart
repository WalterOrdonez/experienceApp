import '../../domain/entities/onboarding_image_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';

/// Implementación concreta del repositorio de onboarding
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDatasource localDatasource;

  const OnboardingRepositoryImpl({required this.localDatasource});

  @override
  List<OnboardingImageEntity> getOnboardingImages() {
    return localDatasource.getImages();
  }
}
