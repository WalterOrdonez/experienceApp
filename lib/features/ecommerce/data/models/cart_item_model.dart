import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

/// Modelo de datos para serializar/deserializar un item del carrito
@freezed
class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    @Default('') String productId,
    @Default('') String productName,
    @Default('') String productImagePath,
    @Default(0.0) double productPrice,
    @Default([]) List<String> productSizes,
    @Default([]) List<int> productColors,
    @Default(0) int quantity,
    @Default('') String selectedSize,
    @Default(0) int selectedColor,
  }) = _CartItemModel;

  /// Convierte desde JSON (Map)
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  /// Convierte desde la entidad de dominio
  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      productId: entity.product.id,
      productName: entity.product.name,
      productImagePath: entity.product.imagePath,
      productPrice: entity.product.price,
      productSizes: entity.product.size,
      productColors: entity.product.color,
      quantity: entity.quantity,
      selectedSize: entity.selectedSize,
      selectedColor: entity.selectedColor,
    );
  }

  /// Convierte a entidad de dominio
  CartItemEntity toEntity() {
    return CartItemEntity(
      product: ProductEntity(
        id: productId,
        name: productName,
        imagePath: productImagePath,
        price: productPrice,
        size: productSizes,
        color: productColors,
      ),
      quantity: quantity,
      selectedSize: selectedSize,
      selectedColor: selectedColor,
    );
  }
}
