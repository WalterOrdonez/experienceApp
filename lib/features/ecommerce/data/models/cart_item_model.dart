import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/product_entity.dart';

/// Modelo de datos para serializar/deserializar un item del carrito
class CartItemModel {
  final String productId;
  final String productName;
  final String productImagePath;
  final double productPrice;
  final List<String> productSizes;
  final List<int> productColors;
  final int quantity;
  final String selectedSize;
  final int selectedColor;

  const CartItemModel({
    required this.productId,
    required this.productName,
    required this.productImagePath,
    required this.productPrice,
    required this.productSizes,
    required this.productColors,
    required this.quantity,
    required this.selectedSize,
    required this.selectedColor,
  });

  /// Convierte desde JSON (Map)
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productImagePath: json['productImagePath'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productSizes: (json['productSizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      productColors: (json['productColors'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      quantity: json['quantity'] as int,
      selectedSize: json['selectedSize'] as String,
      selectedColor: json['selectedColor'] as int,
    );
  }

  /// Convierte a JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImagePath': productImagePath,
      'productPrice': productPrice,
      'productSizes': productSizes,
      'productColors': productColors,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor,
    };
  }

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
