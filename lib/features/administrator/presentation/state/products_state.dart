import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const ProductsState._();

  const factory ProductsState({
    @Default(<ProductEntity>[]) List<ProductEntity> products,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _ProductsState;

  ProductsState merge({
    List<ProductEntity>? products,
    bool? isLoading,
    bool? isSaving,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return copyWith(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
