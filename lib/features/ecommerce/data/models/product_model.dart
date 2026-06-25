import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String id,
    required String name,
    required String imagePath,
    required double price,
    required List<String> size,
    required List<int> color,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

// otra forma de crear to Entity
extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      imagePath: imagePath,
      price: price,
      size: size,
      color: color,
    );
  }
}

extension ProductListX on List<ProductModel> {
  List<ProductEntity> toEntityList() {
    return map((product) => product.toEntity()).toList();
  }
}
