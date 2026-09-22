import 'package:flutter_prototype/features/ecommerce/data/datasources/sale_datasource.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/sale_entity.dart';
import 'package:flutter_prototype/features/ecommerce/domain/repositories/sale_repository.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleDataSource saleDataSource;

  const SaleRepositoryImpl({required this.saleDataSource});

  @override
  Future<String> registerSale(SaleEntity sale) async {
    return await saleDataSource.registerSale(sale);
  }
}
