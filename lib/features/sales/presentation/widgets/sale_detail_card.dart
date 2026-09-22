import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';

class SaleDetailCard extends StatelessWidget {
  const SaleDetailCard({
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
    final localDate = date.toLocal().toIso8601String().split('T');
    final day = localDate.first;
    final time = localDate.last.split('.').first;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Pago exitoso',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          const _DashedDivider(),
          const SizedBox(height: 16),
          _SaleDetailRow(label: 'N° de venta', value: saleId),
          const SizedBox(height: 12),
          _SaleDetailRow(label: 'Fecha', value: day),
          const SizedBox(height: 12),
          _SaleDetailRow(label: 'Hora', value: time),
        ],
      ),
    );
  }
}

class _SaleDetailRow extends StatelessWidget {
  const _SaleDetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const dashWidth = 6.0;
          const dashSpacing = 4.0;
          final dashCount = (constraints.maxWidth / (dashWidth + dashSpacing))
              .floor();
          return Row(
            children: List.generate(
              dashCount,
              (_) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: dashSpacing / 2),
                child: SizedBox(
                  width: dashWidth,
                  height: 1,
                  child: ColoredBox(color: AppColors.grey300),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
