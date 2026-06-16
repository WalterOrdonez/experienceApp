import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Stream<List<ProductEntity>> watchProducts();

  Future<void> saveProduct({required ProductEntity product});

  Future<void> deleteProduct(String id);
}
