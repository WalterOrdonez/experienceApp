import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

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
}
