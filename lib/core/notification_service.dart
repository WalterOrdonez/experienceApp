import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_prototype/firebase_options.dart';
import 'package:flutter_prototype/features/login/domain/usecases/save_device_token.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('Background message received: ${message.messageId}');
  debugPrint('Background message data: ${message.data}');
}

class NotificationService {
  static const String _webVapidKey = String.fromEnvironment(
    'FIREBASE_WEB_VAPID_KEY',
  );

  final FirebaseMessaging _firebaseMessaging;
  final SaveDeviceToken _saveDeviceToken;
  final FlutterLocalNotificationsPlugin _localNotifications;
  final void Function(RemoteMessage message)? _onForegroundMessage;
  final void Function(RemoteMessage message)? _onNotificationOpened;

  NotificationService({
    FirebaseMessaging? firebaseMessaging,
    SaveDeviceToken? saveDeviceToken,
    void Function(RemoteMessage message)? onForegroundMessage,
    void Function(RemoteMessage message)? onNotificationOpened,
  }) : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance,
       _saveDeviceToken = saveDeviceToken ?? SaveDeviceToken(),
       _localNotifications = FlutterLocalNotificationsPlugin(),
       _onForegroundMessage = onForegroundMessage,
       _onNotificationOpened = onNotificationOpened;

  Future<void> init() async {
    await _requestPermissions();
    await _initRemoteNotifications();
    if (!kIsWeb) {
      await _initLocalNotifications();
      await _initNotificationInteractions();
    }
  }

  Future<void> _requestPermissions() async {
    try {
      debugPrint('FCM init start');

      final actualSettings = await _firebaseMessaging.getNotificationSettings();
      debugPrint('Current notification settings: $actualSettings');
      debugPrint(
        'Current notification settings: ${actualSettings.authorizationStatus}',
      );

      debugPrint('Requesting notification permission...');
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      debugPrint(
        'Notification permission settings: ${settings.authorizationStatus}',
      );
    } catch (e, st) {
      debugPrint('FCM init error: $e');
      debugPrint('Stacktrace: $st');
    }
  }

  Future<void> _initRemoteNotifications() async {
    try {
      if (kIsWeb && _webVapidKey.isEmpty) {
        debugPrint(
          'FIREBASE_WEB_VAPID_KEY is empty. Define it to get web FCM token.',
        );
      }
      debugPrint('Requesting FCM token...');
      final token = await _firebaseMessaging.getToken(
        vapidKey: kIsWeb && _webVapidKey.isNotEmpty ? _webVapidKey : null,
      );

      if (token == null || token.isEmpty) {
        debugPrint('FCM token is null/empty. Check permission and VAPID key.');
      } else {
        debugPrint('FCM Token: $token');
        await _persistDeviceToken(token);
      }

      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        debugPrint('FCM token refreshed');
        await _persistDeviceToken(newToken);
      });

      debugPrint('FCM init completed');

      FirebaseMessaging.onMessage.listen(_foregroundMessageHandler);
    } catch (e, st) {
      debugPrint('FCM init error: $e');
      debugPrint('Stacktrace: $st');
    }
  }

  Future<void> _persistDeviceToken(String token) async {
    try {
      await _saveDeviceToken(token: token);
      debugPrint('FCM token stored in usuarios.deviceTokens');
    } catch (e, st) {
      debugPrint('Error storing FCM token in Firestore: $e');
      debugPrint('Stacktrace: $st');
    }
  }

  Future<void> _initNotificationInteractions() async {
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint(
        'App opened from terminated by notification: ${initialMessage.messageId}',
      );
      _onNotificationOpened?.call(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint(
        'App opened from background by notification: ${message.messageId}',
      );
      _onNotificationOpened?.call(message);
    });
  }

  void _foregroundMessageHandler(RemoteMessage message) {
    debugPrint('Foreground message received: ${message.messageId}');
    debugPrint('Message data: ${message.data}');
    _onForegroundMessage?.call(message);

    if (message.notification != null) {
      debugPrint(
        'Notification title: ${message.notification?.title}, body: ${message.notification?.body}',
      );
      if (!kIsWeb) _showLocalNotification(message);
    }
  }

  Future<void> _initLocalNotifications() async {
    const canal = AndroidNotificationChannel(
      'canal_alta_prioridad',
      'Avisos importantes',
      description: 'Este canal se utiliza para notificaciones importantes.',
      importance: Importance.high,
    );
    debugPrint('Creating notification channel: ${canal.id}');
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(canal);
    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (details) {
        debugPrint('Notification tapped: ${details.payload}');
      },
    );
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'General',
      channelDescription:
          'Este canal se utiliza para notificaciones generales.',
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );
    debugPrint('Showing local notification for message: ${message.messageId}');
    await _localNotifications.show(
      id: message.hashCode,
      title: message.notification?.title ?? 'Notificación',
      body: message.notification?.body ?? '',
      notificationDetails: details,
      payload: message.data.toString(),
    );
  }
}
