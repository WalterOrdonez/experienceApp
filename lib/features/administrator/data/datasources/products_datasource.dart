import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

abstract class ProductsDatasource {
  Stream<List<ProductModel>> watchProducts();

  Future<void> saveProduct({required ProductModel product});

  Future<void> deleteProduct(String id);
}
