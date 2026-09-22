import 'package:flutter_prototype/features/ecommerce/domain/entities/sale_entity.dart';
import 'package:flutter_prototype/features/ecommerce/domain/repositories/sale_repository.dart';

class RegisterSale {
  final SaleRepository repository;

  RegisterSale(this.repository);

  Future<String> call({required String userId, required double total}) async {
    return await repository.registerSale(
      SaleEntity(userId: userId, date: DateTime.now(), total: total),
    );
  }
}
