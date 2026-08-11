import 'package:flutter_prototype/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_prototype/features/login/domain/repositories/login_repository.dart';

class SaveDeviceToken {
  final LoginRepository _repository;

  SaveDeviceToken({LoginRepository? repository})
    : _repository = repository ?? LoginRepositoryImpl();

  Future<void> call({required String token}) {
    return _repository.saveDeviceToken(token: token);
  }
}
