import 'package:flutter_prototype/features/profile/data/datasources/profile_datasource.dart';
import 'package:flutter_prototype/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:flutter_prototype/features/profile/domain/repositories/profile_repository.dart';
import 'package:image_picker/image_picker.dart';

/// Implementación del repositorio de perfil usando datasource remoto.
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _datasource;

  ProfileRepositoryImpl({ProfileRemoteDataSource? datasource})
    : _datasource = datasource ?? ProfileFirebaseDataSource();

  @override
  Future<String> uploadProfileImage(XFile image) async {
    return await _datasource.uploadProfileImage(image);
  }

  @override
  Future<String?> getProfileImage() async {
    return await _datasource.getProfileImage();
  }
}
