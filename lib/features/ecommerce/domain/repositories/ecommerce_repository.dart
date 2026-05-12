import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';

/// Contrato del repositorio de Ecommerce
abstract class EcommerceRepository {
  List<ProductEntity> getSuggestions();
}
