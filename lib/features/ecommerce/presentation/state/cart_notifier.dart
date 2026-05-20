import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/product_entity.dart';
import 'cart_state.dart';

/// Notifier que maneja la lógica del carrito de compras
class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState()) {
    _loadData();
  }

  /// Carga datos de ejemplo para el carrito
  void _loadData() {
    state = state.copyWith(
      items: [
        CartItemEntity(
          product: const ProductEntity(
            id: '1',
            name: 'Amazing T-shirt',
            imagePath: 'assets/images/product_1.png',
            price: 12.00,
            size: ['XS', 'S', 'M', 'L', 'XL'],
            color: [0xFF1A1A1A, 0xFF6B6B6B, 0xFFB0B0B0],
          ),
          quantity: 1,
          selectedSize: 'M',
          selectedColor: 0xFF1A1A1A,
        ),
        CartItemEntity(
          product: const ProductEntity(
            id: '2',
            name: 'Faboulous Pants',
            imagePath: 'assets/images/product_2.png',
            price: 15.00,
            size: ['38', '40', '42', '44'],
            color: [0xFF007AFF, 0xFF1A1A1A],
          ),
          quantity: 1,
          selectedSize: '42',
          selectedColor: 0xFF007AFF,
        ),
        CartItemEntity(
          product: const ProductEntity(
            id: '3',
            name: 'Spectacular Dress',
            imagePath: 'assets/images/product_3.png',
            price: 20.00,
            size: ['S', 'M', 'L', 'XL'],
            color: [0xFFD4AF37, 0xFFB0B0B0],
          ),
          quantity: 1,
          selectedSize: 'L',
          selectedColor: 0xFFD4AF37,
        ),
        CartItemEntity(
          product: const ProductEntity(
            id: '4',
            name: 'Stunning Jacket',
            imagePath: 'assets/images/product_4.png',
            price: 18.00,
            size: ['S', 'M', 'L', 'XL'],
            color: [0xFF007AFF, 0xFF1A1A1A],
          ),
          quantity: 1,
          selectedSize: 'M',
          selectedColor: 0xFF007AFF,
        ),
        CartItemEntity(
          product: const ProductEntity(
            id: '5',
            name: 'Wonderful Shoes',
            imagePath: 'assets/images/product_5.png',
            price: 18.00,
            size: ['38', '39', '40', '42'],
            color: [0xFF4CAF50, 0xFF1A1A1A],
          ),
          quantity: 1,
          selectedSize: '39',
          selectedColor: 0xFF4CAF50,
        ),
      ],
    );
  }

  /// Agrega un producto al carrito
  void addItem(CartItemEntity item) {
    final existingIndex = state.items.indexWhere(
      (i) => i.product.id == item.product.id,
    );
    if (existingIndex >= 0) {
      // Si ya existe, incrementar cantidad
      incrementQuantity(existingIndex);
    } else {
      state = state.copyWith(items: [...state.items, item]);
    }
  }

  /// Agrega un item usando una entidad de producto y la selección actual
  void addItemFromProductDetail({
    required ProductEntity product,
    required int selectedSizeIndex,
    required int selectedColorIndex,
  }) {
    final safeSizeIndex = product.size.isNotEmpty
        ? selectedSizeIndex.clamp(0, product.size.length - 1)
        : 0;
    final safeColorIndex = product.color.isNotEmpty
        ? selectedColorIndex.clamp(0, product.color.length - 1)
        : 0;

    final selectedSize = product.size.isNotEmpty
        ? product.size[safeSizeIndex]
        : 'M';
    final selectedColor = product.color.isNotEmpty
        ? product.color[safeColorIndex]
        : 0xFF1A1A1A;

    final item = CartItemEntity(
      product: product,
      quantity: 1,
      selectedSize: selectedSize,
      selectedColor: selectedColor,
    );

    addItem(item);
  }

  /// Elimina un item del carrito por índice
  void removeItem(int index) {
    final updated = List<CartItemEntity>.from(state.items)..removeAt(index);
    state = state.copyWith(items: updated);
  }

  /// Incrementa la cantidad de un item
  void incrementQuantity(int index) {
    final updated = List<CartItemEntity>.from(state.items);
    updated[index] = updated[index].copyWith(
      quantity: updated[index].quantity + 1,
    );
    state = state.copyWith(items: updated);
  }

  /// Decrementa la cantidad de un item (mínimo 1)
  void decrementQuantity(int index) {
    final updated = List<CartItemEntity>.from(state.items);
    if (updated[index].quantity > 1) {
      updated[index] = updated[index].copyWith(
        quantity: updated[index].quantity - 1,
      );
      state = state.copyWith(items: updated);
    }
  }
}

/// Provider del notifier del carrito
final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});
