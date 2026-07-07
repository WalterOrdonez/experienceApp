import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/features/sales/presentation/state/sales_dashboard_notifier.dart';
import 'package:flutter_prototype/features/sales/presentation/widgets/sales_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SalesDashboardView extends ConsumerWidget {
  const SalesDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(salesDashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Dashboard'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: (sales) => const Center(child: CircularProgressIndicator()),
          loaded: (sales) {
            if (sales.isEmpty) {
              return const Center(
                child: Text(
                  'No hay ventas para mostrar',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: sales.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final sale = sales[index];
                  return SalesCard(sale: sale, index: index);
                },
              ),
            );
          },
          error: (sales, message) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Error: $message',
                style: const TextStyle(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
