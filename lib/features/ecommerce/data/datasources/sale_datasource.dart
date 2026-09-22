import 'package:flutter_prototype/features/ecommerce/domain/entities/sale_entity.dart';

/// Contrato base para las fuentes de datos de ventas
abstract class SaleDataSource {
  Future<String> registerSale(SaleEntity sale);
}
