import 'dart:convert';
import '../../../../core/local_storage.dart';
import '../models/cart_item_model.dart';

/// Datasource local para persistir el carrito usando LocalStorage
class CartLocalDatasource {
  static const String _cartKey = 'cart_items';

  final LocalStorage _localStorage;

  const CartLocalDatasource(this._localStorage);

  /// Obtiene los items del carrito almacenados localmente
  List<CartItemModel> getCartItems() {
    final jsonList = _localStorage.prefs.getStringList(_cartKey);
    if (jsonList == null || jsonList.isEmpty) return [];

    return jsonList
        .map(
          (item) =>
              CartItemModel.fromJson(json.decode(item) as Map<String, dynamic>),
        )
        .toList();
  }

  /// Guarda la lista de items del carrito en local storage
  Future<void> saveCartItems(List<CartItemModel> items) async {
    final jsonList = items.map((item) => item.toJson()).toList();
    await _localStorage.prefs.setStringList(
      _cartKey,
      jsonList.map((e) => json.encode(e)).toList(),
    );
  }

  /// Limpia el carrito del local storage
  Future<void> clearCart() async {
    await _localStorage.prefs.remove(_cartKey);
  }
}
