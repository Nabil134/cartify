import 'dart:io';
import 'package:cartify/core/navigation/navigation_service.dart';
import 'package:cartify/routes/routes_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  NotificationService._();
  /*instances start here*/
static final FirebaseMessaging _messaging=FirebaseMessaging.instance;
static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
/*instances end here*/
/*init start here*/
static Future<void> init() async{
// Android settings
  const AndroidInitializationSettings androidInitializationSettings =
  AndroidInitializationSettings('@drawable/ic_notification');

  // iOS settings
  const DarwinInitializationSettings iosInitializationSettings =
  DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  // Combined settings
  const InitializationSettings initializationSettings =
  InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
  );
  await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onDidReceiveNotificationResponse: (payload){
NavigationService.navigatorKey.currentState?.pushNamed(RoutesName.bottom);
    }
  );
  // ✅ create high priority channel

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'cartify_channel',
    'Cartify Notifications',
    description: 'Cartify app notifications',
    importance: Importance.max,
    playSound: true,
    enableVibration: true,
  );
  // ✅ Create notification channel (Android 8.0+)
  await _flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  // ✅ Request notification permission (Android 13+)
  await _flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
}
/*init end here*/
  /*requestPermission start here*/
  static Future<void> requestPermission() async {
    final NotificationSettings settings =
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (kDebugMode) {
      debugPrint('🔑 Permission: ${settings.authorizationStatus}',);
    }
  }
/*requestPermission end here*/
/*getDeviceToken start here*/
  static Future<String?> getDeviceToken() async {
    final String? token = await _messaging.getToken();
    if (kDebugMode) {
      debugPrint('📱 FCM Token: $token');
    }
    return token;
  }
  /*getDeviceToken end here*/

  /*isTokenRefresh start here*/
  static void isTokenRefresh() {
    _messaging.onTokenRefresh.listen((newToken) {
      if (kDebugMode) {
        debugPrint('🔄 New Token: $newToken');
      }
    });
  }
/*isTokenRefresh end here*/
/*firebaseInit start here*/
static void firebaseInit(){
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if(kDebugMode){
      debugPrint('🔔 Foreground Notification Received!');
      debugPrint('Title: ${message.notification?.title ?? "No title"}');
      debugPrint('Body: ${message.notification?.body ?? "No body"}');
      debugPrint('Data: ${message.data}');
    }
    // ✅ show local notification on Android
    if(Platform.isAndroid){
showNotification(message);
    }
  });
}
/*firebaseInit end here*/
/*showNotification start here*/
static Future<void> showNotification(RemoteMessage message) async{
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    message.notification?.android?.channelId ?? 'cartify_channel',
    message.notification?.android?.channelId ?? 'Cartify Notifications',
    importance: Importance.max,
    showBadge: true,
    playSound: true,
  );
  final AndroidNotificationDetails androidNotificationDetails =
  AndroidNotificationDetails(
    channel.id,
    channel.name,
    sound: const RawResourceAndroidNotificationSound('notification'),
    icon: '@drawable/ic_notification',
    channelDescription: 'Cartify app notifications',
    importance: Importance.max,
    priority: Priority.max,
    playSound: true,
    enableVibration: true,
    color: const Color(0xFF6C63FF),
    styleInformation: BigTextStyleInformation(
      message.notification?.body ?? '',
      contentTitle: message.notification?.title ?? 'Cartify',
      htmlFormatBigText: true,
      htmlFormatContentTitle: true,
    ),
  );
  const DarwinNotificationDetails darwinNotificationDetails =
  DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );
  final NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: darwinNotificationDetails,
  );
  await _flutterLocalNotificationsPlugin.show(
    message.hashCode,
    message.notification?.title ?? 'Cartify',
    message.notification?.body ?? '',
    notificationDetails,
  );
}
/*showNotification end here*/
/*setInteractMessage start here*/
static Future<void> setInteractMessage() async{
  // ✅ terminated state
  RemoteMessage? initialMessage= await FirebaseMessaging.instance.getInitialMessage();
  if(initialMessage!=null){
    if(kDebugMode){
      debugPrint('🔔 Notification Tapped (Terminated)');
      debugPrint('Data: ${initialMessage.data}');
    }
    Future.delayed(const Duration(seconds: 2), () {
      handleMessage(initialMessage);
    });
  }
  // ✅ background state
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (kDebugMode) {
      debugPrint('🔔 Notification Tapped (Background)');
      debugPrint('Data: ${message.data}');
    }
    handleMessage(message);
  });
}
/*setInteractMessage end here*/
/*handleMessage start here*/
static void handleMessage(RemoteMessage message){
  final String? screen=message.data["screen"];
  if(screen==null){
    return;
  }
  final navigatorState =
      NavigationService.navigatorKey.currentState;
  if(navigatorState==null){
if(kDebugMode){
  debugPrint('❌ Navigator not ready — retrying...');
}
Future.delayed(const Duration(seconds: 1),(){
  handleMessage(message);
});
return;
  }
switch(screen){
  case "home":
    NavigationService.navigatorKey.currentState?.pushNamed(RoutesName.bottom);
    break;
  case "favorite":
    NavigationService.navigatorKey.currentState?.pushNamed(RoutesName.fav);
    break;
  case "cart":
    NavigationService.navigatorKey.currentState?.pushNamed(RoutesName.cart);
    break;
  default:
    NavigationService.navigatorKey.currentState?.pushNamed(RoutesName.bottom);
    break;
}
}
/*handleMessage end here*/
}