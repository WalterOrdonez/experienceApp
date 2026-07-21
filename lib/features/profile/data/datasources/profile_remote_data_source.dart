import 'dart:developer' as developer;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_prototype/features/profile/data/datasources/profile_datasource.dart';
import 'package:image_picker/image_picker.dart';

/// Implementación de [ProfileRemoteDataSource] que se conecta a Firebase.
class ProfileFirebaseDataSource implements ProfileRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  ProfileFirebaseDataSource({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
    FirebaseStorage? storage,
  }) : _firestore = firestore ?? FirebaseFirestore.instance,
       _auth = auth ?? FirebaseAuth.instance,
       _storage = storage ?? FirebaseStorage.instance;

  @override
  Future<String> uploadProfileImage(XFile image) async {
    final startTime = DateTime.now();
    final userId = _auth.currentUser?.uid;

    if (userId == null) {
      throw Exception('Usuario no autenticado');
    }

    developer.log(
      'Iniciando carga de imagen de perfil para usuario: $userId',
      name: 'profile.datasource',
    );

    try {
      // Referencia en Storage con ruta profile_images/{userId}.jpg
      final storageRef = _storage.ref().child('profile_images/$userId.jpg');

      // Leer bytes de la imagen (compatible con web y mobile)
      final Uint8List imageBytes = await image.readAsBytes();

      // Subir bytes a Firebase Storage con metadata del tipo de archivo
      final metadata = SettableMetadata(
        contentType: 'image/${image.name.split('.').last}',
      );
      final uploadTask = await storageRef.putData(imageBytes, metadata);

      // Obtener URL de descarga
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      // Guardar la URL en Firestore en el documento del usuario
      await _firestore.collection('users').doc(userId).set(
        {'profileImageUrl': downloadUrl},
        SetOptions(merge: true),
      );

      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      developer.log(
        'Imagen de perfil cargada exitosamente en ${durationMs}ms. URL: $downloadUrl',
        name: 'profile.datasource',
      );

      return downloadUrl;
    } catch (e, stackTrace) {
      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      developer.log(
        'Error al cargar imagen de perfil después de ${durationMs}ms: $e',
        name: 'profile.datasource',
        error: e,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw Exception('Error al cargar la imagen de perfil: $e');
    }
  }

  @override
  Future<String?> getProfileImage() async {
    final userId = _auth.currentUser?.uid;

    if (userId == null) {
      throw Exception('Usuario no autenticado');
    }

    developer.log(
      'Obteniendo imagen de perfil para usuario: $userId',
      name: 'profile.datasource',
    );

    try {
      final userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        final imageUrl = userDoc.data()?['profileImageUrl'] as String?;
        developer.log(
          'Imagen de perfil obtenida: ${imageUrl != null ? "encontrada" : "no encontrada"}',
          name: 'profile.datasource',
        );
        return imageUrl;
      }

      developer.log(
        'Documento de usuario no existe en Firestore',
        name: 'profile.datasource',
      );
      return null;
    } catch (e, stackTrace) {
      developer.log(
        'Error al obtener imagen de perfil: $e',
        name: 'profile.datasource',
        error: e,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw Exception('Error al obtener la imagen de perfil: $e');
    }
  }
}
