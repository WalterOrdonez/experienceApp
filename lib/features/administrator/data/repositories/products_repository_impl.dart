import 'package:flutter_prototype/features/administrator/data/datasources/products_datasource.dart';
import 'package:flutter_prototype/features/administrator/domain/repositories/products_repository.dart';
import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDatasource datasource;

  const ProductsRepositoryImpl({required this.datasource});

  @override
  Stream<List<ProductEntity>> watchProducts() {
    return datasource.watchProducts().map(
      (products) => products.map(ProductEntity.fromModel).toList(),
    );
  }

  @override
  Future<void> saveProduct({required ProductEntity product}) {
    return datasource.saveProduct(product: _mapEntityToModel(product));
  }

  @override
  Future<void> deleteProduct(String id) {
    return datasource.deleteProduct(id);
  }

  ProductModel _mapEntityToModel(ProductEntity product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      imagePath: product.imagePath,
      price: product.price,
      size: product.size,
      color: product.color,
    );
  }
}
