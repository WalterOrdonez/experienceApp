import 'package:flutter_prototype/features/sales/domain/entities/sale.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_dashboard_state.freezed.dart';


@freezed
abstract class SalesDashboardState with _$SalesDashboardState {
  const factory SalesDashboardState.initial() = _Initial;
  const factory SalesDashboardState.loading({required List<Sale> sales}) = _Loading;
  const factory SalesDashboardState.loaded({
    required List<Sale> sales,
  }) = _Loaded;
  const factory SalesDashboardState.error({
    required List<Sale> sales,
    required String message,
  }) = _Error;
}