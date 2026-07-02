import 'package:flutter_prototype/features/sales/data/datasources/sales_firestore_datasource.dart';
import 'package:flutter_prototype/features/sales/domain/entities/sale.dart';
import 'package:flutter_prototype/features/sales/domain/repositories/sales_repository.dart';
import 'package:flutter_prototype/features/sales/data/models/sale_model.dart';

class SalesRepositoryImpl extends SalesRepository {
  final SalesFirestoreDatasource _dataSource;

  SalesRepositoryImpl({SalesFirestoreDatasource? dataSource})
    : _dataSource = dataSource ?? SalesFirestoreDatasource();

  @override
  Stream<List<Sale>> getSalesStream() {
    return _dataSource.getSalesmodelsStream().map(
      (list) => list.toEntityList(),
    );
  }
}
