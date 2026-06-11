import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

/// Contrato base para las fuentes de datos de ecommerce
abstract class EcommerceDatasource {
  Future<List<ProductModel>> getSuggestions();
}
