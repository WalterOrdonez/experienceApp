import 'package:flutter_prototype/features/administrator/domain/repositories/products_repository.dart';

class DeleteProduct {
  final ProductsRepository _repository;

  const DeleteProduct(this._repository);

  Future<void> call({required String id}) {
    return _repository.deleteProduct(id);
  }
}
