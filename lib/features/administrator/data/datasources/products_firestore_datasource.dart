import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prototype/features/administrator/data/datasources/products_datasource.dart';
import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

class ProductsFirestoreDatasource implements ProductsDatasource {
  final FirebaseFirestore _firestore;

  ProductsFirestoreDatasource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> watchProducts() {
    return _firestore
        .collection('products')
        .orderBy('name')
        .snapshots()
        .map((snapshot) => snapshot.docs.map(_mapDocumentToProduct).toList());
  }

  @override
  Future<void> saveProduct({required ProductModel product}) async {
    final payload = {
      'name': product.name,
      'imagePath': product.imagePath,
      'price': product.price,
      'size': product.size,
      'color': product.color,
    };

    if (product.id.isEmpty) {
      await _firestore.collection('products').add(payload);
      return;
    }

    await _firestore
        .collection('products')
        .doc(product.id)
        .set(payload, SetOptions(merge: true));
  }

  @override
  Future<void> deleteProduct(String id) {
    return _firestore.collection('products').doc(id).delete();
  }

  ProductModel _mapDocumentToProduct(
    QueryDocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();

    return ProductModel(
      id: document.id,
      name: (data['name'] as String?) ?? '',
      imagePath: (data['imagePath'] as String?) ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0,
      size: ((data['size'] as List<dynamic>?) ?? const [])
          .map((item) => item.toString())
          .toList(),
      color: ((data['color'] as List<dynamic>?) ?? const [])
          .map(
            (item) => item is String ? int.parse(item) : (item as num).toInt(),
          )
          .toList(),
    );
  }
}
