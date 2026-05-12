import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product_entity.dart';
import 'ecommerce_state.dart';

/// Notifier que maneja la lógica de la vista de Ecommerce
class EcommerceNotifier extends StateNotifier<EcommerceState> {
  EcommerceNotifier() : super(const EcommerceState()) {
    _loadInitialData();
  }

  /// Carga datos iniciales (banners y productos de ejemplo)
  void _loadInitialData() {
    state = state.copyWith(
      bannerImages: [
        'assets/images/banner_1.png',
        'assets/images/banner_2.png',
        'assets/images/banner_3.png',
      ],
      newArrivals: const [
        ProductEntity(
          id: '1',
          name: 'Roller Rabbit',
          imagePath: 'assets/images/product_1.png',
          price: 198.00,
          size: 'M',
          color: 'Vado Odelle Dress',
        ),
        ProductEntity(
          id: '2',
          name: 'Axel Arigato',
          imagePath: 'assets/images/product_2.png',
          price: 245.00,
          size: 'L',
          color: 'Clean 90 Triple Sneakers',
        ),
        ProductEntity(
          id: '3',
          name: 'Herschel Supply Co.',
          imagePath: 'assets/images/product_3.png',
          price: 120.00,
          size: 'One Size',
          color: 'Classic Backpack',
        ),
        ProductEntity(
          id: '4',
          name: 'Adidas',
          imagePath: 'assets/images/product_4.png',
          price: 150.00,
          size: '42',
          color: 'Ultraboost 22',
        ),
      ],
    );
  }

  /// Actualiza el índice del banner actual en el carrusel
  void setCurrentBannerIndex(int index) {
    state = state.copyWith(currentBannerIndex: index);
  }

  /// Actualiza el tab seleccionado en la barra de navegación
  void setSelectedNavIndex(int index) {
    state = state.copyWith(selectedNavIndex: index);
  }
}

/// Provider del notifier de Ecommerce
final ecommerceProvider =
    StateNotifierProvider<EcommerceNotifier, EcommerceState>((ref) {
      return EcommerceNotifier();
    });
