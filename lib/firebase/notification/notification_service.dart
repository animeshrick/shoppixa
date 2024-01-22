import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/utils/logger.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

class FirebaseNotificationService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin localNotification =
      FlutterLocalNotificationsPlugin();

  Future<void> requestNotificationPermission() async {
    /// request permission
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    AppLog.w('User permission status: ${settings.authorizationStatus}');

    /// Permission granted
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      /* FCM Token */
      // await getDeviceToken();
      //firebaseInit();
    }

    /// Permission provisional
    else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      /// provisional
      AppLog.w('User granted provisional permission');
      NotificationSettings settings =
          await firebaseMessaging.getNotificationSettings();
      AppLog.w('User granted provisional permission $settings');
    }

    /// Permission denied
    else {
      /// open settings for permission
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      AppLog.w('User declined or has not accepted permission');
    }
  }

  Future<String> getDeviceToken() async {
    /// device token
    String? fcmToken = await firebaseMessaging.getToken();
    AppLog.w("Token: $fcmToken");
    return fcmToken ?? "";
  }

  void isTokenRefresh() {
    firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  Future<void> initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    /* handle local notification when user inside app */

    /// android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    /// ios
    var iosSetting = const DarwinInitializationSettings();

    /// initialization
    var initSetting = InitializationSettings(
        android: initializationSettingsAndroid, iOS: iosSetting);

    await localNotification.initialize(initSetting,
        onDidReceiveNotificationResponse: (payload) {
      print("Local-Notification handleMessage");
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    /// handle on message event
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        //AppLog.w('Got a message whilst in the foreground!');
        AppLog.w('Message Body: ${message.notification?.body ?? ""}');
        AppLog.w('Message Title: ${message.notification?.title ?? ""}');
        AppLog.w('Message Data: ${message.data}');
      }
      // if (Platform.isAndroid) {
      initLocalNotifications(context, message);
      showNotification(message);
      if (kIsWeb) {
        /// web
        print("kisweb");
      }
      /*} else if(kIsWeb) {
        /// web
        print("kisweb");
      }else {
        /// ios
      }*/
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationDetails channel = AndroidNotificationDetails(
      Random.secure().nextInt(1000).toString(),
      "High Importance Notification",
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.channelId.toString(),
      channel.channelName.toString(),
      channelDescription: "your channel description",
      priority: Priority.high,
      importance: Importance.high,
      ticker: 'ticker',
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    AppLog.w('localNotification will show');
    Future.delayed(Duration.zero, () async {
      await localNotification.show(
        0,
        message.notification?.title ?? "",
        message.notification?.body ?? "",
        notificationDetails,
      );
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    /// when app is killed/ terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print("when app is killed/ terminated");
      handleMessage(context, initialMessage);
    }

    /// when app is background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("when app is background");
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data != {}) {
      /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NotificationScreen(
                dataFromNotification: message.data ?? {},
              )));*/
      if (kIsWeb) {
        context.goNamed(MyRoutes.notification, extra: message.data);
      } else {
        context.pushNamed(MyRoutes.notification, extra: message.data);
      }
    }
  }
}
