import 'package:flutter/material.dart';
import 'package:flutter_prototype/features/sales/presentation/state/sales_dashboard_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SalesDashboardView extends ConsumerWidget {
  const SalesDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(salesDashboardProvider);

    final Widget child = state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: (sales) => const Center(child: CircularProgressIndicator()),
      loaded: (sales) =>
          Column(children: sales.map((sale) => Text('${sale.total}')).toList()),
      error: (sales, message) => Center(child: Text('Error: $message')),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Sales Dashboard')),
      body: Center(child: child),
    );
  }
}
