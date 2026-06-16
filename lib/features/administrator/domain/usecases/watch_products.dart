import 'package:flutter_prototype/features/administrator/domain/repositories/products_repository.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';

class WatchProducts {
  final ProductsRepository _repository;

  const WatchProducts(this._repository);

  Stream<List<ProductEntity>> call() {
    return _repository.watchProducts();
  }
}
