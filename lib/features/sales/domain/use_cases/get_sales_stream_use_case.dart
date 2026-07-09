import 'package:flutter_prototype/features/sales/data/repositories/sales_repository_impl.dart';
import 'package:flutter_prototype/features/sales/domain/entities/sale.dart';
import 'package:flutter_prototype/features/sales/domain/repositories/sales_repository.dart';

class GetSalesStreamUseCase {
  final SalesRepository repository;

  GetSalesStreamUseCase({SalesRepository? repository})
    : repository = repository ?? SalesRepositoryImpl();

  Stream<List<Sale>> call({required String userId}) {
    return repository.getSalesStream(userId: userId);
  }
}
