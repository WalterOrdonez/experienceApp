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

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "imagePath": imagePath,
  //   "price": price,
  //   "size": List<dynamic>.from(size.map((x) => x)),
  //   "color": List<dynamic>.from(color.map((x) => x)),
  // };
  // factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
  //   id: json["id"],
  //   name: json["name"],
  //   imagePath: json["imagePath"],
  //   price: json["price"].toDouble(),
  //   size: List<String>.from(json["size"].map((x) => x)),
  //   color: List<int>.from(json["color"].map((x) => x)),
  // );
}
