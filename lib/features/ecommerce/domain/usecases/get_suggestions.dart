import '../entities/product_entity.dart';
import '../repositories/ecommerce_repository.dart';

/// Caso de uso para obtener los productos sugeridos
class GetSuggestions {
  final EcommerceRepository repository;

  const GetSuggestions(this.repository);

  List<ProductEntity> call() {
    return repository.getSuggestions();
  }
}
