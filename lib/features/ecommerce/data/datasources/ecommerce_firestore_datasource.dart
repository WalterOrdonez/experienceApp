import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';

import 'ecommerce_datasource.dart';

/// Fuente de datos remota para productos sugeridos usando Firestore
class EcommerceFirestoreDatasource extends EcommerceDatasource {
  final FirebaseFirestore firestore;

  EcommerceFirestoreDatasource({required this.firestore});

  @override
  Future<List<ProductModel>> getSuggestions() async {
    final snapshot = await firestore.collection('products').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();

      return ProductModel(
        id: doc.id,
        name: (data['name'] as String?) ?? '',
        imagePath: (data['imagePath'] as String?) ?? '',
        price: (data['price'] as num?)?.toDouble() ?? 0,
        size: ((data['size'] as List<dynamic>?) ?? const [])
            .map<String>((item) => item.toString())
            .toList(),
        color: ((data['color'] as List<dynamic>?) ?? const [])
            .map<int>(
              (item) =>
                  item is String ? int.parse(item) : (item as num).toInt(),
            )
            .toList(),
      );
    }).toList();
  }
}
