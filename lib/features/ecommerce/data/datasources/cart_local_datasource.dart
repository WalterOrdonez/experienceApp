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
    final jsonString = _localStorage.prefs.getString(_cartKey);
    if (jsonString == null || jsonString.isEmpty) return [];

    final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
    return jsonList
        .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Guarda la lista de items del carrito en local storage
  Future<void> saveCartItems(List<CartItemModel> items) async {
    final jsonList = items.map((item) => item.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await _localStorage.prefs.setString(_cartKey, jsonString);
  }

  /// Limpia el carrito del local storage
  Future<void> clearCart() async {
    await _localStorage.prefs.remove(_cartKey);
  }
}
