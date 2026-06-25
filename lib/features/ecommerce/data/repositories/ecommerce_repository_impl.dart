import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/ecommerce_repository.dart';
import '../datasources/ecommerce_datasource.dart';

/// Implementación del repositorio de Ecommerce usando datasource local
class EcommerceRepositoryImpl implements EcommerceRepository {
  final EcommerceDatasource datasource;

  const EcommerceRepositoryImpl({required this.datasource});

  @override
  Future<List<ProductEntity>> getSuggestions() async {
    final suggestions = await datasource.getSuggestions();

    return suggestions.toEntityList();
  }
}
