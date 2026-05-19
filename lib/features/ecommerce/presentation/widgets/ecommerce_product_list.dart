import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/product_entity.dart';
import '../state/product_detail_notifier.dart';
import 'product_card.dart';

/// Widget parametrizable de listado de productos con título y lista horizontal
class EcommerceProductList extends ConsumerWidget {
  final String title;
  final List<ProductEntity> products;

  const EcommerceProductList({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header con título y botón "See All"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Lista horizontal de productos
        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                onTap: () {
                  // Cargar datos del producto en el notifier y navegar
                  ref
                      .read(productDetailProvider.notifier)
                      .loadProduct(products[index]);
                  ref.read(routerProvider).push(AppRoutes.ecommerceDetail);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
