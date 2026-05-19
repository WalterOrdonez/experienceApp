import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/ecommerce_repository.dart';
import '../datasources/ecommerce_local_datasource.dart';

/// Implementación del repositorio de Ecommerce usando datasource local
class EcommerceRepositoryImpl implements EcommerceRepository {
  final EcommerceLocalDatasource localDatasource;

  const EcommerceRepositoryImpl({required this.localDatasource});

  @override
  List<ProductEntity> getSuggestions() {
    List<ProductModel> sugestions = localDatasource.getSuggestions();

    return sugestions
        .map((product) => ProductEntity.fromModel(product))
        .toList();
  }
}
