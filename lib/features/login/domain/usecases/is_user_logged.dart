import 'package:flutter_prototype/features/login/domain/repositories/login_repository.dart';

class IsUserLogged {
  final LoginRepository _repository;

  const IsUserLogged(this._repository);

  Future<bool> call() {
    return _repository.isLogged();
  }
}
