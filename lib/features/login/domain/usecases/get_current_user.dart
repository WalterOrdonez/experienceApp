import 'package:flutter_prototype/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_prototype/features/login/domain/entities/user_entity.dart';
import 'package:flutter_prototype/features/login/domain/repositories/login_repository.dart';

class GetCurrentUser {
  final LoginRepository _repository;

  GetCurrentUser({LoginRepository? repository})
    : _repository = repository ?? LoginRepositoryImpl();

  Future<UserEntity?> call() {
    return _repository.getCurrentUser();
  }
}
