import 'dart:async';

import 'package:flutter_prototype/features/sales/domain/use_cases/get_sales_stream_use_case.dart';
import 'package:flutter_prototype/features/sales/presentation/state/sales_dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesDashboardProvider = StateNotifierProvider.autoDispose
    .family<SalesDashboardNotifier, SalesDashboardState, String>((ref, userId) {
      return SalesDashboardNotifier(userId: userId);
    });

class SalesDashboardNotifier extends StateNotifier<SalesDashboardState> {
  final GetSalesStreamUseCase _getSalesStreamUseCase;
  final String _userId;

  SalesDashboardNotifier({
    required String userId,
    GetSalesStreamUseCase? getSalesStreamUseCase,
  }) : _userId = userId,
       _getSalesStreamUseCase =
           getSalesStreamUseCase ?? GetSalesStreamUseCase(),
       super(SalesDashboardState.initial()) {
    _init();
  }

  StreamSubscription? _salesStreamSubscription;

  Future<void> _init() async {
    state = SalesDashboardState.loading(sales: []);
    try {
      _salesStreamSubscription = _getSalesStreamUseCase(userId: _userId).listen(
        (sales) {
          print('Received sales update: ${sales.length} items');
          state = SalesDashboardState.loaded(sales: sales);
        },
      );
    } catch (e) {
      print('Error fetching sales stream: $e');
      state = SalesDashboardState.error(sales: [], message: e.toString());
    }
  }

  @override
  void dispose() {
    _salesStreamSubscription?.cancel();
    super.dispose();
  }
}
