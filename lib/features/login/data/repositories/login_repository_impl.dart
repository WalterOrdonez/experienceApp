import 'package:flutter_prototype/features/login/data/datasources/login_datasource.dart';
import 'package:flutter_prototype/features/login/data/datasources/login_firebase_datasource.dart';
import 'package:flutter_prototype/features/login/data/models/user_password_model.dart';
import 'package:flutter_prototype/features/login/domain/entities/user_entity.dart';
import 'package:flutter_prototype/features/login/domain/repositories/login_repository.dart';

/// Implementación del repositorio de login usando datasource remoto.
class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImpl({LoginDatasource? datasource})
    : _datasource = datasource ?? FirebaseLoginDatasource();

  @override
  Future<UserEntity> login({
    required UserPasswordModel userPasswordModel,
  }) async {
    final model = await _datasource.login(userPasswordModel: userPasswordModel);
    return UserEntity.fromModel(model);
  }

  @override
  Future<bool> isLogged() {
    return _datasource.isLogged();
  }

  @override
  Future<bool> logout() {
    return _datasource.logout();
  }
}
