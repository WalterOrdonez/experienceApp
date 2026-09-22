import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/core/theme/app_text_styles.dart';
import 'package:flutter_prototype/features/sales/presentation/widgets/sale_detail_card.dart';

class SaleDetailView extends StatelessWidget {
  const SaleDetailView({
    required this.saleId,
    required this.amount,
    required this.date,
    super.key,
  });

  final String saleId;
  final double amount;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de venta'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Recibo de venta', style: AppTextStyles.heading),
              const SizedBox(height: 4),
              const Text(
                'Resumen del pago realizado',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),
              SaleDetailCard(saleId: saleId, amount: amount, date: date),
            ],
          ),
        ),
      ),
    );
  }
}
