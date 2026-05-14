import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

/// Estado del detalle de producto
@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(0) int currentImageIndex,
    @Default([]) List<String> productImages,
    @Default('') String name,
    @Default(0.0) double price,
    @Default('') String description,
    @Default([]) List<String> availableSizes,
    @Default('') String selectedSize,
    @Default([]) List<int> availableColors,
    @Default(0) int selectedColorIndex,
    @Default(false) bool isFavorite,
  }) = _ProductDetailState;
}
