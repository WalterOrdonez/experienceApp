import 'package:dio/dio.dart';
import 'package:flutter_prototype/features/ecommerce/data/models/payment_response_model.dart';

class PaymentDataSource {
  static const enyoiApiUrl = 'sfdkfoab2q-uc.a.run.app';

  final dio = Dio();
  Future<PaymentResponseModel> processPayment({
    required double amount,
    required String cardNumber,
  }) async {
    final url = 'https://processpayment-$enyoiApiUrl';

    final response = await dio.post(
      url,
      data: {'amount': amount, 'cardNumber': cardNumber, 'currency': 'USD'},
    );

    return PaymentResponseModel.fromJson(response.data);
  }
}
