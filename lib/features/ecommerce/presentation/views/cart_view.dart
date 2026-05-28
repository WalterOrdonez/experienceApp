import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/navigation/app_router.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/state/checkout_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../state/cart_notifier.dart';
import '../widgets/cart_footer.dart';
import '../widgets/ecommerce_header.dart';
import '../widgets/cart_item_tile.dart';

/// Vista del carrito de compras (Your bag)
class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header con botón atrás y título
            const EcommerceHeader(title: 'Your Bag'),
            const SizedBox(height: 8),
            // Lista de items del carrito
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: state.items.length,
                separatorBuilder: (_, _) =>
                    const Divider(height: 32, color: AppColors.dotInactive),
                itemBuilder: (context, index) {
                  return CartItemTile(
                    item: state.items[index],
                    onIncrement: () {
                      ref.read(cartProvider.notifier).incrementQuantity(index);
                    },
                    onDecrement: () {
                      ref.read(cartProvider.notifier).decrementQuantity(index);
                    },
                  );
                },
              ),
            ),
            // Total y botón Checkout
            CartFooter(
              total: state.total,
              onCheckout: () {
                ref.read(checkoutProvider.notifier).setAmount(state.total);
                ref.read(routerProvider).push(AppRoutes.checkout);
              },
            ),
          ],
        ),
      ),
    );
  }
}
