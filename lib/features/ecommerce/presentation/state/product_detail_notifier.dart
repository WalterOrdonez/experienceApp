import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_detail_state.dart';

/// Notifier que maneja la lógica del detalle de producto
class ProductDetailNotifier extends StateNotifier<ProductDetailState> {
  ProductDetailNotifier() : super(const ProductDetailState()) {
    _loadProductData();
  }

  /// Carga datos de ejemplo del producto
  void _loadProductData() {
    state = state.copyWith(
      name: 'Amazing T-Shirt',
      price: 12.00,
      description:
          'The perfect T-shirt for when you want to feel comfortable but still stylish. Amazing for all ocasions. Made of 100% cotton fabric in four colours. Its modern style gives a lighter look to the outfit. Perfect for the warmest days.',
      productImages: [
        'assets/images/product_detail_1.png',
        'assets/images/product_detail_2.png',
        'assets/images/product_detail_3.png',
        'assets/images/product_detail_4.png',
        'assets/images/product_detail_5.png',
      ],
      availableSizes: ['XS', 'S', 'M', 'L', 'XL'],
      selectedSize: 'S',
      // Colores: negro, gris oscuro, gris claro (seleccionado), gris muy claro
      availableColors: [0xFF1A1A1A, 0xFF6B6B6B, 0xFFB0B0B0, 0xFFD9D9D9],
      selectedColorIndex: 2,
    );
  }

  /// Actualiza el índice de la imagen actual del carrusel
  void setCurrentImageIndex(int index) {
    state = state.copyWith(currentImageIndex: index);
  }

  /// Selecciona una talla
  void selectSize(String size) {
    state = state.copyWith(selectedSize: size);
  }

  /// Selecciona un color por índice
  void selectColor(int index) {
    state = state.copyWith(selectedColorIndex: index);
  }

  /// Alterna el estado de favorito
  void toggleFavorite() {
    state = state.copyWith(isFavorite: !state.isFavorite);
  }
}

/// Provider del notifier de detalle de producto
final productDetailProvider =
    StateNotifierProvider<ProductDetailNotifier, ProductDetailState>((ref) {
      return ProductDetailNotifier();
    });
