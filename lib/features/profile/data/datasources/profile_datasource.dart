import 'package:image_picker/image_picker.dart';

/// Contrato base para las fuentes de datos remotas del perfil.
abstract class ProfileRemoteDataSource {
  /// Sube la imagen de perfil a Firebase Storage y guarda la URL en Firestore.
  Future<String> uploadProfileImage(XFile image);

  /// Obtiene la URL de la imagen de perfil desde Firestore.
  Future<String?> getProfileImage();
}
