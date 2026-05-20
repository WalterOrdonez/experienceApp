import 'package:flutter/material.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/state/cart_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../state/product_detail_notifier.dart';
import '../widgets/add_to_bag_button.dart';
import '../widgets/product_color_selector.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/product_name_favorite.dart';
import '../widgets/product_size_selector.dart';

/// Vista de detalle de producto con carrusel, tallas, colores y botón de compra
class EcommerceDetailView extends ConsumerStatefulWidget {
  const EcommerceDetailView({super.key});

  @override
  ConsumerState<EcommerceDetailView> createState() =>
      _EcommerceDetailViewState();
}

class _EcommerceDetailViewState extends ConsumerState<EcommerceDetailView> {
  final PageController _imageController = PageController();

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Contenido scrolleable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Carrusel de imágenes del producto
                    ProductImageCarousel(
                      images: state.productImages,
                      currentIndex: state.currentImageIndex,
                      pageController: _imageController,
                      onPageChanged: (index) {
                        ref
                            .read(productDetailProvider.notifier)
                            .setCurrentImageIndex(index);
                      },
                      onClose: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(height: 24),
                    // Información del producto
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nombre + favorito
                          ProductNameFavorite(
                            name: state.name,
                            isFavorite: state.isFavorite,
                            onFavoriteTap: () {
                              ref
                                  .read(productDetailProvider.notifier)
                                  .toggleFavorite();
                            },
                          ),
                          const SizedBox(height: 4),
                          // Precio
                          Text(
                            '€ ${state.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Descripción
                          Text(state.description, style: AppTextStyles.body),
                          const SizedBox(height: 24),
                          // Selector de talla
                          ProductSizeSelector(
                            sizes: state.availableSizes,
                            selectedSize: state.selectedSize,
                            onSizeSelected: (size) {
                              ref
                                  .read(productDetailProvider.notifier)
                                  .selectSize(size);
                            },
                          ),
                          const SizedBox(height: 24),
                          // Selector de color
                          ProductColorSelector(
                            colors: state.availableColors,
                            selectedIndex: state.selectedColorIndex,
                            onColorSelected: (index) {
                              ref
                                  .read(productDetailProvider.notifier)
                                  .selectColor(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Botón "Add to bag" fijo en la parte inferior
            AddToBagButton(
              onPressed: () {
                final product = ref
                    .read(productDetailProvider.notifier)
                    .buildProductEntity();
                ref
                    .read(cartProvider.notifier)
                    .addItemFromProductDetail(
                      product: product,
                      selectedSizeIndex: state.selectedSize,
                      selectedColorIndex: state.selectedColorIndex,
                    );
                ref.read(routerProvider).push(AppRoutes.cart);
              },
            ),
          ],
        ),
      ),
    );
  }
}
