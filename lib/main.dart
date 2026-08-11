import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/local_storage.dart';
import 'package:flutter_prototype/core/navigation/app_router.dart';
import 'package:flutter_prototype/core/notification_service.dart';
import 'package:flutter_prototype/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void _showForegroundSnackBar(RemoteMessage message) {
  final messenger = rootScaffoldMessengerKey.currentState;
  if (messenger == null) return;

  final title = message.notification?.title ?? 'Mensaje recibido';
  final body = message.notification?.body ?? '';
  final dataText = message.data.isNotEmpty ? message.data.toString() : '';

  final content = [
    if (body.isNotEmpty) body,
    if (dataText.isNotEmpty) dataText,
  ].join('\n');

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Text(content.isEmpty ? title : '$title\n$content'),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
    ),
  );
}

void _showNotificationOpenedSnackBar(RemoteMessage message) {
  final messenger = rootScaffoldMessengerKey.currentState;
  if (messenger == null) return;

  final title = message.notification?.title ?? 'Notificacion abierta';
  final body = message.notification?.body ?? '';

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Text(body.isEmpty ? title : '$title\n$body'),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
    ),
  );
}

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  // Inicializar LocalStorage antes de correr la app
  await LocalStorage().init();
  await NotificationService(
    onForegroundMessage: _showForegroundSnackBar,
    onNotificationOpened: _showNotificationOpenedSnackBar,
  ).init();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
