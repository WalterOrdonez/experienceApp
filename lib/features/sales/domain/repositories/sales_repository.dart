import 'package:flutter_prototype/features/sales/domain/entities/sale.dart';

abstract class SalesRepository {
  Stream<List<Sale>> getSalesStream();
}
