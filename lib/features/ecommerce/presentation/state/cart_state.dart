import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart_item_entity.dart';

part 'cart_state.freezed.dart';

/// Estado del carrito de compras
@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({@Default([]) List<CartItemEntity> items}) =
      _CartState;

  /// Calcula el total del carrito
  double get total => items.fold(0.0, (sum, item) => sum + item.totalPrice);
}
