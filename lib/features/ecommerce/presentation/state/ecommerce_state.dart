import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_entity.dart';

part 'ecommerce_state.freezed.dart';

/// Estado principal de la vista de Ecommerce
@freezed
class EcommerceState with _$EcommerceState {
  const factory EcommerceState.initial({
    @Default(0) int currentBannerIndex,
    @Default([]) List<String> bannerImages,
    @Default([]) List<ProductEntity> newArrivals,
    @Default(0) int selectedNavIndex,
  }) = _EcommerceState;

  const factory EcommerceState.loading() = _EcommerceStateLoading;

  const factory EcommerceState.loaded({
    required int currentBannerIndex,
    required List<String> bannerImages,
    required List<ProductEntity> newArrivals,
    required int selectedNavIndex,
  }) = _EcommerceStateLoaded;

  const factory EcommerceState.selectNavigationIndex(int selectedNavIndex) =
      _EcommerceStateSelectNavigationIndex;
  const factory EcommerceState.setCurrentBannerIndex(int currentBannerIndex) =
      _EcommerceStateSetCurrentBannerIndex;
  const factory EcommerceState.setBannerImages(List<String> bannerImages) =
      _EcommerceStateSetBannerImages;
  const factory EcommerceState.setNewArrivals(List<ProductEntity> newArrivals) =
      _EcommerceStateSetNewArrivals;

  const factory EcommerceState.error(String message) = _EcommerceStateError;
}

/// Getters seguros para reutilizar el acceso al estado en la vista.
extension EcommerceStateX on EcommerceState {
  int get safeCurrentBannerIndex => maybeMap(
    initial: (s) => s.currentBannerIndex,
    loaded: (s) => s.currentBannerIndex,
    orElse: () => 0,
  );

  List<String> get safeBannerImages => maybeMap(
    initial: (s) => s.bannerImages,
    loaded: (s) => s.bannerImages,
    orElse: () => const <String>[],
  );

  List<ProductEntity> get safeNewArrivals => maybeMap(
    initial: (s) => s.newArrivals,
    loaded: (s) => s.newArrivals,
    orElse: () => const <ProductEntity>[],
  );

  int get safeSelectedNavIndex => maybeMap(
    initial: (s) => s.selectedNavIndex,
    loaded: (s) => s.selectedNavIndex,
    orElse: () => 0,
  );
}
