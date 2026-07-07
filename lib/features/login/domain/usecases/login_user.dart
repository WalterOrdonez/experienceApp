import 'package:flutter_prototype/features/login/data/models/user_password_model.dart';
import 'package:flutter_prototype/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_prototype/features/login/domain/entities/user_entity.dart';
import 'package:flutter_prototype/features/login/domain/repositories/login_repository.dart';

class LoginUser {
  final LoginRepository _repository;

  LoginUser({LoginRepository? repository})
    : _repository = repository ?? LoginRepositoryImpl();

  Future<UserEntity> call({required UserPasswordModel credentials}) {
    return _repository.login(userPasswordModel: credentials);
  }
}
