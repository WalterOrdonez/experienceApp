import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_prototype/features/sales/domain/entities/sale.dart';
import 'package:flutter_prototype/core/utils/timestamp_converter.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

@freezed
class SaleModel with _$SaleModel {
  @JsonSerializable(explicitToJson: true)
  const factory SaleModel({
    required String id,
    required double total,
    required String usuario,
    @TimestampConverter() required DateTime date,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
}

extension SaleModelX on SaleModel {
  Sale toEntity() => Sale(id: id, total: total, usuario: usuario, date: date);
}

extension SaleModelListEx on List<SaleModel> {
  List<Sale> toEntityList() => map((e) => e.toEntity()).toList();
}
