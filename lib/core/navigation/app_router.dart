import 'package:flutter_prototype/features/ecommerce/presentation/views/add_payment_card_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/cart_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/checkout_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/ecommerce_detail_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/ecommerce_view.dart';
import 'package:flutter_prototype/features/login/presentation/views/login_view.dart';
import 'package:flutter_prototype/features/onboarding/presentation/views/onboarding_next_view.dart';
import 'package:flutter_prototype/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Provider del router para acceder a la navegación desde cualquier lugar
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.onboardingNext,
        builder: (context, state) => const OnboardingNextView(),
      ),
      GoRoute(
        path: AppRoutes.ecommerce,
        builder: (context, state) => const EcommerceView(),
      ),
      GoRoute(
        path: AppRoutes.ecommerceDetail,
        builder: (context, state) => const EcommerceDetailView(),
      ),
      GoRoute(
        path: AppRoutes.cart,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: AppRoutes.checkout,
        builder: (context, state) => const CheckoutView(),
      ),
      GoRoute(
        path: AppRoutes.addPaymentCard,
        builder: (context, state) => const AddPaymentCardView(),
      ),
    ],
  );
});

/// Rutas de la aplicación
abstract class AppRoutes {
  static const login = '/';
  static const onboarding = '/onboarding';
  static const onboardingNext = '/onboarding-next';
  static const ecommerce = '/ecommerce';
  static const ecommerceDetail = '/ecommerce-detail';
  static const cart = '/cart';
  static const addPaymentCard = '/add-payment-card';
  static const checkout = '/checkout';
}
