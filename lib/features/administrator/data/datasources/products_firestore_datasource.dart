import 'dart:developer' as developer;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_prototype/features/administrator/data/datasources/products_datasource.dart';
import 'package:flutter_prototype/features/ecommerce/data/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class ProductsFirestoreDatasource implements ProductsDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ProductsFirestoreDatasource({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  }) : _firestore = firestore ?? FirebaseFirestore.instance,
       _storage = storage ?? FirebaseStorage.instance;

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

  @override
  String generateProductId() => _firestore.collection('products').doc().id;

  @override
  Future<String> uploadProductImage(XFile image, String productId) async {
    developer.log(
      'Subiendo imagen de producto: $productId',
      name: 'products.datasource',
    );

    final Uint8List imageBytes = await image.readAsBytes();
    final ext = image.name.split('.').last.toLowerCase();
    final storageRef = _storage.ref().child('product_images/$productId.jpg');
    final metadata = SettableMetadata(contentType: 'image/$ext');
    final uploadTask = await storageRef.putData(imageBytes, metadata);
    final downloadUrl = await uploadTask.ref.getDownloadURL();

    developer.log(
      'Imagen de producto subida exitosamente. URL: $downloadUrl',
      name: 'products.datasource',
    );

    return downloadUrl;
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
          .map(_normalizeStoredColor)
          .whereType<String>()
          .toList(),
    );
  }

  String? _normalizeStoredColor(dynamic raw) {
    if (raw is String) {
      final value = raw.trim().toUpperCase();
      if (value.isEmpty) {
        return null;
      }

      final cleaned = value.replaceAll('#', '').replaceAll('0X', '');
      if (cleaned.length == 6) {
        return '#FF$cleaned';
      }
      if (cleaned.length == 8) {
        return '#$cleaned';
      }
      return null;
    }

    if (raw is num) {
      final hex = raw.toInt().toRadixString(16).toUpperCase().padLeft(8, '0');
      return '#$hex';
    }

    return null;
  }
}
