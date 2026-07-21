import 'package:flutter/foundation.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/add_payment_card_view.dart';
import 'package:flutter_prototype/features/administrator/presentation/views/products_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/cart_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/checkout_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/ecommerce_detail_view.dart';
import 'package:flutter_prototype/features/ecommerce/presentation/views/ecommerce_view.dart';
import 'package:flutter_prototype/features/login/presentation/state/login_notifier.dart';
import 'package:flutter_prototype/features/login/presentation/views/login_view.dart';
import 'package:flutter_prototype/features/onboarding/presentation/views/onboarding_next_view.dart';
import 'package:flutter_prototype/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_prototype/features/sales/presentation/views/sales_dashboard_view.dart';
import 'package:flutter_prototype/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerRefreshProvider = Provider<ValueNotifier<bool>>((ref) {
  final refresh = ValueNotifier<bool>(false);

  ref.listen(loginProvider, (previous, next) {
    if (previous?.isLogged != next.isLogged ||
        previous?.isCheckingSession != next.isCheckingSession) {
      refresh.value = !refresh.value;
    }
  });

  ref.onDispose(refresh.dispose);
  return refresh;
});

/// Provider del router para acceder a la navegación desde cualquier lugar
final routerProvider = Provider<GoRouter>((ref) {
  final refreshListenable = ref.read(routerRefreshProvider);

  return GoRouter(
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final loginState = ref.read(loginProvider);
      final isLogged = loginState.isLogged;
      final isCheckingSession = loginState.isCheckingSession;
      final currentLocation = state.uri.path;
      final loggingIn = currentLocation == AppRoutes.login;
      final onboarding =
          currentLocation == AppRoutes.onboarding ||
          currentLocation == AppRoutes.onboardingNext;

      if (isCheckingSession) {
        return null;
      }

      if (!isLogged && !loggingIn && !onboarding) {
        return AppRoutes.login;
      }

      if (isLogged && loggingIn) {
        return AppRoutes.salesDashboard;
      }

      return null;
    },
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
        path: AppRoutes.adminProducts,
        builder: (context, state) => const ProductsView(),
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
      GoRoute(
        path: AppRoutes.salesDashboard,
        builder: (context, state) => const SalesDashboardView(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfileView(),
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
  static const adminProducts = '/admin-products';
  static const ecommerceDetail = '/ecommerce-detail';
  static const cart = '/cart';
  static const addPaymentCard = '/add-payment-card';
  static const checkout = '/checkout';
  static const salesDashboard = '/sales-dashboard';
  static const profile = '/profile';
}
