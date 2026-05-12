import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_entity.dart';

part 'ecommerce_state.freezed.dart';

/// Estado principal de la vista de Ecommerce
@freezed
class EcommerceState with _$EcommerceState {
  const factory EcommerceState({
    @Default(0) int currentBannerIndex,
    @Default([]) List<String> bannerImages,
    @Default([]) List<ProductEntity> newArrivals,
    @Default(0) int selectedNavIndex,
  }) = _EcommerceState;
}
