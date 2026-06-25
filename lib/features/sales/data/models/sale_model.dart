import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_prototype/features/sales/domain/entities/sale.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({required double total}) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
}

extension SaleModelX on SaleModel {
  Sale toEntity() => Sale(total: total);
}

extension SaleModelListEx on List<SaleModel> {
  List<Sale> toEntityList() => map((e) => e.toEntity()).toList();
}
