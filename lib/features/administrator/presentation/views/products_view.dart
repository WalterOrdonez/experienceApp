import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/core/theme/app_text_styles.dart';
import 'package:flutter_prototype/features/administrator/presentation/state/products_notifier.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/product_admin_card.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/product_form_sheet.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/products_collection_banner.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/products_empty_state.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/products_summary_card.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsView extends ConsumerWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(productsProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    final state = ref.watch(productsProvider);
    final products = state.products;
    final totalVariants = products.fold<int>(
      0,
      (sum, product) => sum + product.size.length,
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.isSaving
            ? null
            : () => _openProductSheet(context, product: null),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Nuevo producto'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Product Admin', style: AppTextStyles.heading),
                      const SizedBox(height: 8),
                      const Text(
                        'Administra el catálogo de productos y mantén sincronizada la experiencia de compra.',
                        style: AppTextStyles.body,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: ProductsSummaryCard(
                              label: 'Productos',
                              value: products.length.toString(),
                              icon: Icons.inventory_2_outlined,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ProductsSummaryCard(
                              label: 'Variantes',
                              value: totalVariants.toString(),
                              icon: Icons.category_outlined,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const ProductsCollectionBanner(),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Inventario activo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.grey300),
                            ),
                            child: Text(
                              '${products.length} items',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (state.isLoading)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 48),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      else if (products.isEmpty)
                        const ProductsEmptyState()
                      else
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductAdminCard(
                              product: product,
                              isBusy: state.isSaving,
                              onEdit: () =>
                                  _openProductSheet(context, product: product),
                              onDelete: () =>
                                  _confirmDelete(context, ref, product),
                            );
                          },
                        ),
                      const SizedBox(height: 96),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openProductSheet(
    BuildContext context, {
    ProductEntity? product,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProductFormSheet(product: product),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    ProductEntity product,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: const Text('Eliminar producto'),
          content: Text('Se eliminará ${product.name} del catálogo.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await ref.read(productsProvider.notifier).deleteProduct(product.id);
    }
  }
}
