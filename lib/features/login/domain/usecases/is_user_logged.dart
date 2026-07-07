import 'package:flutter_prototype/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_prototype/features/login/domain/repositories/login_repository.dart';

class IsUserLogged {
  final LoginRepository _repository;

  IsUserLogged({LoginRepository? repository})
    : _repository = repository ?? LoginRepositoryImpl();

  Future<bool> call() {
    return _repository.isLogged();
  }
}
