import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product_entity.dart';
import 'product_detail_state.dart';

/// Notifier que maneja la lógica del detalle de producto
class ProductDetailNotifier extends StateNotifier<ProductDetailState> {
  ProductDetailNotifier() : super(const ProductDetailState());

  /// Carga los datos de un producto específico
  void loadProduct(ProductEntity product) {
    state = state.copyWith(
      name: product.name,
      price: product.price,
      description:
          'The perfect T-shirt for when you want to feel comfortable but still stylish. Amazing for all ocasions. Made of 100% cotton fabric in four colours. Its modern style gives a lighter look to the outfit. Perfect for the warmest days.',
      productImages: [
        product.imagePath,
        product.imagePath,
        product.imagePath,
        product.imagePath,
        product.imagePath,
      ],
      availableSizes: product.size,
      selectedSize: 0,
      availableColors: product.color,
      selectedColorIndex: 0,
      currentImageIndex: 0,
      isFavorite: false,
    );
  }

  /// Actualiza el índice de la imagen actual del carrusel
  void setCurrentImageIndex(int index) {
    state = state.copyWith(currentImageIndex: index);
  }

  /// Selecciona una talla
  void selectSize(int index) {
    state = state.copyWith(selectedSize: index);
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
