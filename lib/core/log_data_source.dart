import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class LogDataSource {
  final FirebaseFirestore _firestore;

  LogDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> logEvent(
    String eventName,
    Map<String, dynamic> eventData,
  ) async {
    try {
      await _firestore.collection('logs').add({
        'event_name': eventName,
        'event_data': eventData,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint('Error logging event: $e');
    }
  }
}
