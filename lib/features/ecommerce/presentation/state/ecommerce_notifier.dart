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
      newArrivals: [],
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
