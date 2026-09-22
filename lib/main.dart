import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/local_storage.dart';
import 'package:flutter_prototype/core/navigation/app_router.dart';
import 'package:flutter_prototype/core/notification_service.dart';
import 'package:flutter_prototype/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final NotificationService notificationService = NotificationService();

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inicializar LocalStorage antes de correr la app
  await LocalStorage().init();
  await notificationService.init();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    notificationService.setRouter(router);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final initialMessage = await notificationService.getInitialMessage();
      if (initialMessage != null) {
        debugPrint(
          'App opened from terminated state by notification: ${initialMessage.messageId}',
        );
      }

      final title =
          initialMessage?.notification?.title ??
          'App abierta desde notificación';
      // Mismo criterio de título que NotificationService._initMessageOpenedHandler
      switch (title) {
        case 'Profile':
          router.go(AppRoutes.profile);
          break;
        case 'Sales':
          router.go(AppRoutes.salesDashboard, extra: initialMessage?.data);
          break;
        case 'SaleDetail':
          router.go(AppRoutes.saleDetail, extra: initialMessage?.data);
          break;
        default:
          break;
      }
    });

    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
