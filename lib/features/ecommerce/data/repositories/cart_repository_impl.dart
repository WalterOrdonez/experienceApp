import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_local_datasource.dart';
import '../models/cart_item_model.dart';

/// Implementación del repositorio del carrito usando datasource local
class CartRepositoryImpl implements CartRepository {
  final CartLocalDatasource localDatasource;

  const CartRepositoryImpl({required this.localDatasource});

  @override
  List<CartItemEntity> getCartItems() {
    final models = localDatasource.getCartItems();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> saveCartItems(List<CartItemEntity> items) async {
    final models = items.map((item) => CartItemModel.fromEntity(item)).toList();
    await localDatasource.saveCartItems(models);
  }

  @override
  Future<void> clearCart() async {
    await localDatasource.clearCart();
  }
}
