import 'dart:async';

import 'package:flutter_prototype/features/sales/domain/use_cases/get_sales_stream_use_case.dart';
import 'package:flutter_prototype/features/sales/presentation/state/sales_dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef SalesDashboardArgs = ({String saleId, String userId});

final salesDashboardProvider =
    NotifierProvider.family<
      SalesDashboardNotifier,
      SalesDashboardState,
      SalesDashboardArgs
    >(() {
      return SalesDashboardNotifier();
    });

class SalesDashboardNotifier
    extends FamilyNotifier<SalesDashboardState, SalesDashboardArgs> {
  final GetSalesStreamUseCase _getSalesStreamUseCase;

  SalesDashboardNotifier({GetSalesStreamUseCase? getSalesStreamUseCase})
    : _getSalesStreamUseCase = getSalesStreamUseCase ?? GetSalesStreamUseCase();

  StreamSubscription? _salesStreamSubscription;

  String get saleId => arg.saleId;
  String get userId => arg.userId;

  void _listenSales(String userId) {
    _salesStreamSubscription?.cancel();
    _salesStreamSubscription = _getSalesStreamUseCase(userId: userId).listen(
      (sales) {
        state = SalesDashboardState.loaded(sales: sales);
      },
      onError: (Object e) {
        state = SalesDashboardState.error(sales: [], message: e.toString());
      },
    );
  }

  @override
  SalesDashboardState build(SalesDashboardArgs args) {
    ref.onDispose(() => _salesStreamSubscription?.cancel());

    if (args.userId.isEmpty) {
      return SalesDashboardState.initial();
    }

    _listenSales(args.userId);
    return SalesDashboardState.loading(sales: []);
  }
}
