class GetProfileUseCase {
  final ProfileRepository _repository;

  GetProfileUseCase({ProfileRepository? repository})
    : _repository = repository ?? ProfileRepositoryImpl();

  Future<Profile> call() async {
    return await _repository.getProfile();
  }
}
