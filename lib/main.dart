import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/local_storage.dart';
import 'package:flutter_prototype/core/navigation/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar LocalStorage antes de correr la app
  await LocalStorage().init();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
