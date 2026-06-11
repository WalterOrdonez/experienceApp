import 'package:flutter_prototype/features/login/data/models/user_password_model.dart';
import 'package:flutter_prototype/features/login/domain/entities/user_entity.dart';

/// Contrato del repositorio de autenticación.
abstract class LoginRepository {
  Future<UserEntity> login({required UserPasswordModel userPasswordModel});

  Future<bool> isLogged();

  Future<bool> logout();
}
