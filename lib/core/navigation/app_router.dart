import 'package:flutter_prototype/features/onboarding/presentation/views/onboarding_next_view.dart';
import 'package:flutter_prototype/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Provider del router para acceder a la navegación desde cualquier lugar
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.onboardingNext,
        builder: (context, state) => const OnboardingNextView(),
      ),
    ],
  );
});

/// Rutas de la aplicación
abstract class AppRoutes {
  static const onboarding = '/';
  static const onboardingNext = '/onboarding-next';
}
