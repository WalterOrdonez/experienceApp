import 'package:flutter_prototype/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_prototype/features/profile/domain/repositories/profile_repository.dart';

/// Caso de uso para obtener la imagen de perfil del usuario.
class GetProfileUseCase {
  final ProfileRepository _repository;

  GetProfileUseCase({ProfileRepository? repository})
    : _repository = repository ?? ProfileRepositoryImpl();

  /// Retorna la URL de la imagen de perfil o null si no existe.
  Future<String?> call() async {
    return await _repository.getProfileImage();
  }
}
