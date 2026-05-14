import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/ecommerce_local_datasource.dart';
import '../../data/repositories/ecommerce_repository_impl.dart';
import '../../domain/usecases/get_suggestions.dart';
import 'ecommerce_state.dart';

/// Notifier que maneja la lógica de la vista de Ecommerce
class EcommerceNotifier extends StateNotifier<EcommerceState> {
  final GetSuggestions _getSuggestions;

  EcommerceNotifier(this._getSuggestions) : super(const EcommerceState()) {
    _loadInitialData();
  }

  /// Carga datos iniciales (banners y productos sugeridos)
  void _loadInitialData() {
    final suggestions = _getSuggestions();
    state = state.copyWith(
      bannerImages: [
        'assets/images/banner_1.png',
        'assets/images/banner_2.png',
        'assets/images/banner_3.png',
      ],
      newArrivals: suggestions,
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
      final datasource = EcommerceLocalDatasource();
      final repository = EcommerceRepositoryImpl(localDatasource: datasource);
      final getSuggestions = GetSuggestions(repository);
      return EcommerceNotifier(getSuggestions);
    });
