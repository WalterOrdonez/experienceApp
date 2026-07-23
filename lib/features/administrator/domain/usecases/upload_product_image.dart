import 'package:flutter_prototype/features/administrator/domain/repositories/products_repository.dart';
import 'package:image_picker/image_picker.dart';

class UploadProductImage {
  final ProductsRepository _repository;

  UploadProductImage(this._repository);

  Future<String> call(XFile image, String productId) {
    return _repository.uploadProductImage(image, productId);
  }
}
