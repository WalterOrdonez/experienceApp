import 'dart:async';

import 'package:flutter_prototype/features/administrator/data/datasources/products_firestore_datasource.dart';
import 'package:flutter_prototype/features/administrator/data/repositories/products_repository_impl.dart';
import 'package:flutter_prototype/features/administrator/domain/usecases/delete_product.dart';
import 'package:flutter_prototype/features/administrator/domain/usecases/save_product.dart';
import 'package:flutter_prototype/features/administrator/domain/usecases/watch_products.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'products_state.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  final WatchProducts _watchProducts;
  final SaveProduct _saveProduct;
  final DeleteProduct _deleteProduct;
  StreamSubscription<List<ProductEntity>>? _productsSubscription;

  ProductsNotifier(this._watchProducts, this._saveProduct, this._deleteProduct)
    : super(const ProductsState()) {
    _listenToProducts();
  }

  void _listenToProducts() {
    state = state.merge(isLoading: true, clearErrorMessage: true);

    _productsSubscription = _watchProducts().listen(
      (products) {
        state = state.merge(
          isLoading: false,
          products: products,
          clearErrorMessage: true,
        );
      },
      onError: (_) {
        state = state.merge(
          isLoading: false,
          errorMessage: 'No se pudo cargar el catálogo de productos.',
        );
      },
    );
  }

  Future<bool> saveProduct({
    String? id,
    required String name,
    required String imagePath,
    required double price,
    required List<String> size,
    required List<int> color,
  }) async {
    state = state.merge(isSaving: true, clearErrorMessage: true);

    try {
      await _saveProduct(
        product: ProductEntity(
          id: id ?? '',
          name: name,
          imagePath: imagePath,
          price: price,
          size: size,
          color: color,
        ),
      );

      state = state.merge(isSaving: false, clearErrorMessage: true);
      return true;
    } catch (_) {
      state = state.merge(
        isSaving: false,
        errorMessage: 'No se pudo guardar el producto.',
      );
      return false;
    }
  }

  Future<void> deleteProduct(String id) async {
    state = state.merge(isSaving: true, clearErrorMessage: true);

    try {
      await _deleteProduct(id: id);
      state = state.merge(isSaving: false, clearErrorMessage: true);
    } catch (_) {
      state = state.merge(
        isSaving: false,
        errorMessage: 'No se pudo eliminar el producto.',
      );
    }
  }

  @override
  void dispose() {
    _productsSubscription?.cancel();
    super.dispose();
  }
}

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) {
    final datasource = ProductsFirestoreDatasource();
    final repository = ProductsRepositoryImpl(datasource: datasource);

    return ProductsNotifier(
      WatchProducts(repository),
      SaveProduct(repository),
      DeleteProduct(repository),
    );
  },
);
