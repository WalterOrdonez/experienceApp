import 'package:flutter_prototype/features/login/data/models/user_model.dart';
import 'package:flutter_prototype/features/login/data/models/user_password_model.dart';

/// Contrato base para autenticación de login.
abstract class LoginDatasource {
  Future<UserModel> login({required UserPasswordModel userPasswordModel});

  Future<bool> isLogged();

  Future<bool> logout();
}
