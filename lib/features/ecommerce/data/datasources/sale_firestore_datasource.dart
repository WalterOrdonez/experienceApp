import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/sale_entity.dart';

import 'sale_datasource.dart';

/// Fuente de datos remota para ventas usando Firestore
class SaleFirestoreDataSource implements SaleDataSource {
  final FirebaseFirestore firestore;

  SaleFirestoreDataSource({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<String> registerSale(SaleEntity sale) async {
    final docRef = await firestore.collection('sales').add({
      'usuario': sale.userId,
      'date': Timestamp.fromDate(sale.date),
      'total': sale.total,
    });

    return docRef.id;
  }
}
