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
  late final GoRouter router;

  // Reanuda la navegación a la ruta protegida que se pidió sin sesión,
  // una vez que el login se completa (ver captura en `redirect` más abajo).
  ref.listen(loginProvider, (previous, next) {
    final justLoggedIn = !(previous?.isLogged ?? false) && next.isLogged;
    if (!justLoggedIn) return;

    final pending = ref.read(loginProvider.notifier).consumePendingRedirect();
    if (pending != null) {
      router.go(pending.location, extra: pending.extra);
    }
  });

  router = GoRouter(
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final loginNotifier = ref.read(loginProvider.notifier);
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
        loginNotifier.setPendingRedirect(
          state.uri.toString(),
          extra: state.extra,
        );
        return AppRoutes.login;
      }

      if (isLogged && loggingIn) {
        final role = loginState.user?.role ?? '2';
        return role == '1' ? AppRoutes.adminProducts : AppRoutes.ecommerce;
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
        builder: (context, state) {
          // La notificación envía message.data (Map); otros flujos pueden enviar el id directo.
          final extra = state.extra;
          final saleId = switch (extra) {
            String value => value,
            Map<String, dynamic> data => data['saleId']?.toString() ?? '',
            Map data => data['saleId']?.toString() ?? '',
            _ => '',
          };
          return SalesDashboardView(saleId: saleId);
        },
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );

  return router;
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
