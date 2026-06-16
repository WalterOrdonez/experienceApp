import 'package:flutter_prototype/features/administrator/domain/repositories/products_repository.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';

class SaveProduct {
  final ProductsRepository _repository;

  const SaveProduct(this._repository);

  Future<void> call({required ProductEntity product}) {
    return _repository.saveProduct(product: product);
  }
}
