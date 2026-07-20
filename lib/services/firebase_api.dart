import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:cartify/firebase_options.dart';
import 'package:cartify/services/notification_service.dart';

/*firebaseMessagingBackgroundHandler start here*/
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  // ✅ init Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ init NotificationService in background isolate
  await NotificationService.init();

  if (kDebugMode) {
    debugPrint('🔔 Background Notification Received!');
    debugPrint(
        'Title: ${message.notification?.title ?? "No title"}');
    debugPrint(
        'Body: ${message.notification?.body ?? "No body"}');
    debugPrint('Data: ${message.data}');
  }

  // ✅ show notification in background
  if (message.notification == null&&message.data.isNotEmpty) {
    await NotificationService.showNotification(message);
  }
}
/*firebaseMessagingBackgroundHandler end here*/

class FirebaseApi {
  /*initNotifications start here*/
  static Future<void> initNotifications() async {
    // ✅ Step 1 — background handler FIRST
    FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler,
    );

    // ✅ Step 2 — request permission
    await NotificationService.requestPermission();

    // ✅ Step 3 — foreground options for iOS
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // ✅ Step 4 — get device token
    await NotificationService.getDeviceToken();

    // ✅ Step 5 — token refresh
    NotificationService.isTokenRefresh();

    // ✅ Step 6 — foreground handler
    NotificationService.firebaseInit();

    // ✅ Step 7 — background + terminated handler
    await NotificationService.setInteractMessage();
  }
/*initNotifications end here*/
}