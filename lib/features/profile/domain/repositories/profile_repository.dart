import 'package:image_picker/image_picker.dart';

/// Contrato del repositorio de perfil.
abstract class ProfileRepository {
  /// Sube la imagen de perfil y retorna la URL de descarga.
  Future<String> uploadProfileImage(XFile image);

  /// Obtiene la URL de la imagen de perfil del usuario actual.
  Future<String?> getProfileImage();
}
