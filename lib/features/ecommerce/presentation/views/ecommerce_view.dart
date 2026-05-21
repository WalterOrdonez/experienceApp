import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../state/ecommerce_notifier.dart';
import '../widgets/ecommerce_banner_carousel.dart';
import '../widgets/ecommerce_bottom_nav_bar.dart';
import '../widgets/ecommerce_product_list.dart';
import '../widgets/ecommerce_search_bar.dart';

/// Vista principal del Ecommerce con carrusel, productos y navegación
class EcommerceView extends ConsumerStatefulWidget {
  const EcommerceView({super.key});

  @override
  ConsumerState<EcommerceView> createState() => _EcommerceViewState();
}

class _EcommerceViewState extends ConsumerState<EcommerceView> {
  final PageController _bannerController = PageController();

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ecommerceProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Contenido scrolleable
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      // Barra de búsqueda con favoritos y carrito
                      const EcommerceSearchBar(),
                      const SizedBox(height: 24),
                      // Carrusel de banners promocionales
                      EcommerceBannerCarousel(
                        images: state.bannerImages,
                        pageController: _bannerController,
                        currentIndex: state.currentBannerIndex,
                        onPageChanged: (index) {
                          ref
                              .read(ecommerceProvider.notifier)
                              .setCurrentBannerIndex(index);
                        },
                      ),
                      const SizedBox(height: 24),
                      // Listado de productos "New Arrival"
                      EcommerceProductList(
                        title: 'New Arrival',
                        products: state.newArrivals,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            // Barra de navegación inferior
            EcommerceBottomNavBar(
              selectedIndex: state.selectedNavIndex,
              onItemTapped: (index) {
                ref.read(ecommerceProvider.notifier).setSelectedNavIndex(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
