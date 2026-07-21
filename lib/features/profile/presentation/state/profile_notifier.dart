import 'package:flutter_prototype/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_prototype/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_prototype/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:flutter_prototype/features/profile/presentation/state/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// Provider del notifier de perfil
final profileProvider =
    StateNotifierProvider.autoDispose<ProfileNotifier, ProfileState>((ref) {
      return ProfileNotifier();
    });

/// Notifier que maneja la lógica de la vista de perfil
class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository _repository;
  final GetProfileUseCase _getProfileUseCase;

  ProfileNotifier({
    ProfileRepository? repository,
    GetProfileUseCase? getProfileUseCase,
  }) : _repository = repository ?? ProfileRepositoryImpl(),
       _getProfileUseCase = getProfileUseCase ?? GetProfileUseCase(),
       super(const ProfileState.initial()) {
    loadProfileImage();
  }

  /// Carga la imagen de perfil del usuario actual
  Future<void> loadProfileImage() async {
    state = const ProfileState.loading();
    try {
      final imageUrl = await _getProfileUseCase();
      state = ProfileState.loaded(profileImageUrl: imageUrl);
    } catch (e) {
      state = ProfileState.error(message: e.toString());
    }
  }

  /// Sube una nueva imagen de perfil seleccionada por el usuario
  Future<void> uploadProfileImage(XFile image) async {
    final currentUrl = state.maybeWhen(
      loaded: (url) => url,
      orElse: () => null,
    );
    state = ProfileState.uploading(profileImageUrl: currentUrl);
    try {
      final newUrl = await _repository.uploadProfileImage(image);
      state = ProfileState.loaded(profileImageUrl: newUrl);
    } catch (e) {
      state = ProfileState.error(message: e.toString());
    }
  }
}
