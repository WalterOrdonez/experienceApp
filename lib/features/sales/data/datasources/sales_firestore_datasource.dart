import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prototype/features/sales/data/models/sale_model.dart';

class SalesFirestoreDatasource {
  final FirebaseFirestore _firestore;

  SalesFirestoreDatasource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<List<SaleModel>> getSalesmodelsStream() {
    return _firestore
        .collection('sales')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((e) => SaleModel.fromJson(e.data())).toList(),
        );
  }
}
