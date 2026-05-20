import 'product_entity.dart';

/// Entidad que representa un item en el carrito de compras
class CartItemEntity {
  final ProductEntity product;
  final int quantity;
  final String selectedSize;
  final int selectedColor;

  const CartItemEntity({
    required this.product,
    required this.quantity,
    required this.selectedSize,
    required this.selectedColor,
  });

  /// Precio total del item (precio unitario * cantidad)
  double get totalPrice => product.price * quantity;

  /// Crea una copia con valores actualizados
  CartItemEntity copyWith({
    ProductEntity? product,
    int? quantity,
    String? selectedSize,
    int? selectedColor,
  }) {
    return CartItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
