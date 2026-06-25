class GetSalesStreamUseCase {
  final SalesRepository repository;

  GetSalesStreamUseCase({SalesRepository? repository})
    : repository = repository ?? SalesRepositoryImpl();

  Stream<List<Sale>> call() {
    return repository.getSalesStream();
  }
}
