import '../entities/cart_item_entity.dart';

/// Contrato del repositorio del carrito
abstract class CartRepository {
  /// Obtiene los items del carrito persistidos
  List<CartItemEntity> getCartItems();

  /// Guarda los items del carrito
  Future<void> saveCartItems(List<CartItemEntity> items);

  /// Limpia el carrito
  Future<void> clearCart();
}
