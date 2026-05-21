import 'product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_entity.freezed.dart';

/// Entidad que representa un item en el carrito de compras
@freezed
class CartItemEntity with _$CartItemEntity {
  const CartItemEntity._();
  const factory CartItemEntity({
    required ProductEntity product,
    required int quantity,
    required String selectedSize,
    required int selectedColor,
  }) = _CartItemEntity;

  /// Precio total del item (precio unitario * cantidad)
  double get totalPrice => product.price * quantity;

  // /// Crea una copia con valores actualizados
  // CartItemEntity copyWith({
  //   ProductEntity? product,
  //   int? quantity,
  //   String? selectedSize,
  //   int? selectedColor,
  // }) {
  //   return CartItemEntity(
  //     product: product ?? this.product,
  //     quantity: quantity ?? this.quantity,
  //     selectedSize: selectedSize ?? this.selectedSize,
  //     selectedColor: selectedColor ?? this.selectedColor,
  //   );
  // }
}
