import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProductsDatasource {
  Stream<List<ProductModel>> watchProducts();

  Future<void> saveProduct({required ProductModel product});

  Future<void> deleteProduct(String id);

  /// Genera un ID único de documento Firestore sin escribir en la base de datos.
  String generateProductId();

  /// Sube la imagen a Firebase Storage y retorna la URL de descarga.
  Future<String> uploadProductImage(XFile image, String productId);
}
