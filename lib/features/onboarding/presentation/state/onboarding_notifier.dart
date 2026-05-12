import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/onboarding_local_datasource.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../domain/usecases/get_onboarding_images.dart';
import 'onboarding_state.dart';

/// Notifier que maneja la lógica del onboarding
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final GetOnboardingImages _getOnboardingImages;

  OnboardingNotifier(this._getOnboardingImages)
      : super(const OnboardingState()) {
    _loadImages();
  }

  /// Carga las imágenes del carrusel desde el caso de uso
  void _loadImages() {
    final images = _getOnboardingImages();
    state = state.copyWith(images: images);
  }

  /// Actualiza el índice de la imagen actual del carrusel
  void setCurrentImageIndex(int index) {
    state = state.copyWith(currentImageIndex: index);
  }
}

/// Provider del notifier de onboarding
final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  final datasource = OnboardingLocalDatasource();
  final repository = OnboardingRepositoryImpl(localDatasource: datasource);
  final getOnboardingImages = GetOnboardingImages(repository);
  return OnboardingNotifier(getOnboardingImages);
});
