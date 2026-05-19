import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

/// Entidad que representa un producto del ecommerce
class ProductEntity {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final List<String> size;
  final List<int> color;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.size,
    required this.color,
  });

  factory ProductEntity.fromModel(ProductModel model) {
    return ProductEntity(
      id: model.id,
      name: model.name,
      imagePath: model.imagePath,
      price: model.price,
      size: model.size,
      color: model.color,
    );
  }
}
