import 'package:flutter_prototype/features/ecommerce/domain/entities/sale_entity.dart';

abstract class SaleRepository {
  /// Registra una venta ya procesada y devuelve el id generado
  Future<String> registerSale(SaleEntity sale);
}
