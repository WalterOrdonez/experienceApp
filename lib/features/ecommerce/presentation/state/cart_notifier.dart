import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/local_storage.dart';
import '../../data/datasources/cart_local_datasource.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import 'cart_state.dart';

/// Notifier que maneja la lógica del carrito de compras con persistencia
class CartNotifier extends StateNotifier<CartState> {
  final CartRepository _repository;

  CartNotifier(this._repository) : super(const CartState()) {
    _loadFromStorage();
  }

  /// Carga los items del carrito desde local storage
  void _loadFromStorage() {
    final items = _repository.getCartItems();
    state = state.copyWith(items: items);
  }

  /// Persiste el estado actual del carrito
  Future<void> _persist() async {
    await _repository.saveCartItems(state.items);
  }

  /// Agrega un producto al carrito
  Future<void> addItem(CartItemEntity item) async {
    final existingIndex = state.items.indexWhere(
      (i) => i.product.id == item.product.id,
    );
    if (existingIndex >= 0) {
      await incrementQuantity(existingIndex);
    } else {
      state = state.copyWith(items: [...state.items, item]);
      await _persist();
    }
  }

  /// Elimina un item del carrito por índice
  Future<void> removeItem(int index) async {
    final updated = List<CartItemEntity>.from(state.items)..removeAt(index);
    state = state.copyWith(items: updated);
    await _persist();
  }

  /// Incrementa la cantidad de un item
  Future<void> incrementQuantity(int index) async {
    final updated = List<CartItemEntity>.from(state.items);
    updated[index] = updated[index].copyWith(
      quantity: updated[index].quantity + 1,
    );
    state = state.copyWith(items: updated);
    await _persist();
  }

  /// Decrementa la cantidad de un item (mínimo 1)
  Future<void> decrementQuantity(int index) async {
    final updated = List<CartItemEntity>.from(state.items);
    if (updated[index].quantity > 1) {
      updated[index] = updated[index].copyWith(
        quantity: updated[index].quantity - 1,
      );
      state = state.copyWith(items: updated);
      await _persist();
    }
  }

  /// Limpia todo el carrito
  Future<void> clearCart() async {
    state = state.copyWith(items: []);
    await _repository.clearCart();
  }

  /// Agrega un item al carrito desde la vista de detalle de producto
  Future<void> addItemFromProductDetail({
    required ProductEntity product,
    required int selectedSizeIndex,
    required int selectedColorIndex,
  }) async {
    final selectedSize = product.size.isNotEmpty
        ? product.size[selectedSizeIndex]
        : '';
    final selectedColor = product.color.isNotEmpty
        ? product.color[selectedColorIndex]
        : 0;

    final item = CartItemEntity(
      product: product,
      quantity: 1,
      selectedSize: selectedSize,
      selectedColor: selectedColor,
    );

    await addItem(item);
  }
}

/// Provider del notifier del carrito con persistencia
final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  final localStorage = LocalStorage();
  final datasource = CartLocalDatasource(localStorage);
  final repository = CartRepositoryImpl(localDatasource: datasource);
  return CartNotifier(repository);
});
