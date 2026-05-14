import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/dot_indicator.dart';
import '../state/product_detail_notifier.dart';
import '../state/product_detail_state.dart';
import '../widgets/product_color_selector.dart';
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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Carrusel de imágenes del producto con botón cerrar
                    _buildImageCarousel(state),
                    const SizedBox(height: 24),
                    // Información del producto
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nombre + favorito
                          _buildNameAndFavorite(state),
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
            _buildAddToBagButton(),
          ],
        ),
      ),
    );
  }

  /// Carrusel de imágenes con botón de cerrar y dots
  Widget _buildImageCarousel(ProductDetailState state) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          // Fondo del carrusel
          Container(
            height: 300,
            color: AppColors.primaryLight,
            child: PageView.builder(
              controller: _imageController,
              itemCount: state.productImages.length,
              onPageChanged: (index) {
                ref
                    .read(productDetailProvider.notifier)
                    .setCurrentImageIndex(index);
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  state.productImages[index],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 48,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Botón cerrar (X)
          Positioned(
            top: 12,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.close,
                color: AppColors.textPrimary,
                size: 28,
              ),
            ),
          ),
          // Dots en la parte inferior centrados
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: DotIndicator(
              totalPages: state.productImages.length,
              currentPage: state.currentImageIndex,
              style: DotIndicatorStyle.circle,
              alignment: MainAxisAlignment.center,
            ),
          ),
        ],
      ),
    );
  }

  /// Nombre del producto con ícono de favorito
  Widget _buildNameAndFavorite(ProductDetailState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            state.name,
            style: AppTextStyles.heading.copyWith(fontSize: 22),
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(productDetailProvider.notifier).toggleFavorite();
          },
          child: Icon(
            state.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: state.isFavorite ? Colors.red : AppColors.textPrimary,
            size: 26,
          ),
        ),
      ],
    );
  }

  /// Botón de agregar al carrito
  Widget _buildAddToBagButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton.icon(
          onPressed: () {
            // TODO: Implementar acción de agregar al carrito
          },
          icon: const Icon(Icons.add, size: 20),
          label: Text('Add to bag', style: AppTextStyles.button),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
