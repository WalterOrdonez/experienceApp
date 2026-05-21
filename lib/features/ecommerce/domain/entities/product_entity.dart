import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

/// Entidad que representa un producto del ecommerce
@freezed
class ProductEntity with _$ProductEntity {
  const ProductEntity._();
  const factory ProductEntity({
    required String id,
    required String name,
    required String imagePath,
    required double price,
    required List<String> size,
    required List<int> color,
  }) = _ProductEntity;

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
