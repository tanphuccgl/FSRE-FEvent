import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCM {
  static String? fcmToken;
  static bool isFlutterLocalNotificationsInitialized = false;
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static late AndroidNotificationChannel channel;

  static Future initialize() async {
    FirebaseMessaging.instance.requestPermission();
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await config();
    listenLocalNotification();
    FirebaseMessaging.instance.subscribeToTopic('all_users');
  }

  static void listenLocalNotification() {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('launcher_notification');

    final iosInitializationSettings = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            _handlePayload(payload));
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: iosInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) =>
          _handlePayload(details.payload),
    );
  }

  static void _handlePayload(String? payload) {
    if (payload != null) {
      Map parseJson = json.decode(payload);
      _handleMessage(parseJson);
    } else {
      _handleMessage({});
    }
  }

  static _handleMessage(Map<dynamic, dynamic> data) {
    // switch (NotificationTypeExt.fromString(data['type'])) {
    //   case NotificationType.message:
    //   case NotificationType.expiredGroup:
    //   case NotificationType.joinGroup:
    //     String id = data['groupId'];

    //     XCoordinator.rootRouter.pushAndPopUntil(
    //         DashboardWrapperRoute(children: [ActiveChatWrapperRoute(id: id)]),
    //         predicate: (Route<dynamic> route) => false);
    //     break;

    //   case NotificationType.makeFriend:
    //     String? id = data['id'];

    //     if (id != null) {
    //       XCoordinator.rootRouter.pushAndPopUntil(
    //           DashboardWrapperRoute(children: [UserProfileRoute(idUser: id)]),
    //           predicate: (Route<dynamic> route) => false);
    //     }

    //     break;

    //   default:
    //     XCoordinator.rootRouter.push(NotificationsRoute());
    // }
  }

  // static void checkBackgroundNotification() async {
  //   NotificationAppLaunchDetails? details =
  //       await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  //   if (details != null && details.didNotificationLaunchApp) {
  //     _handlePayload(details.notificationResponse?.payload);
  //   } else {
  //     RemoteMessage? remoteMessage =
  //         await FirebaseMessaging.instance.getInitialMessage();
  //     if (remoteMessage != null) {
  //       _handlePayload(json.encode(remoteMessage.data));
  //     }
  //   }
  // }

  static Future<void> config() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'wile-app',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;

    // final WUser? user = UserPrefs().getUser();

    // if (user != null && user.id.isNotEmpty) {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    final String fcmToken = await FirebaseMessaging.instance.getToken(
            vapidKey:
                "AAAAn5LwCqk:APA91bHm-0rsBmYSqwaPR2DXlyN8oCtMjx15FbURgWE0MJI2i5s1CLp2jzTzFxHGNROflEyGDgSHNWxVwvb1YZ6iitn7JH2Kun5CVGj8VV6VP4DkjoRXMYHaV2di9gEJoxIFbcObA6dh") ??
        "";

    debugPrint('FCM Token: $fcmToken');
    // GetIt.I<AccountBloc>().updateToken(fcmToken);

    // await _domain.fCMRepository
    //     .updateFCMToken(id: user.id, newToken: fcmToken);

    // FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
    //   await _domain.fCMRepository.updateFCMToken(
    //       id: user.id, newToken: newToken, oldToken: user.tokenDevice);
    // });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      _handleMessage(message.data);
    });

    FirebaseMessaging.onMessage.listen((message) async {
      final title = message.notification?.title;
      final body = message.notification?.body;
      //  final image = message.notification?.web?.image;

      Flushbar(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(17),
        borderRadius: BorderRadius.circular(8),
        title: title,
        message: body,
        maxWidth: null,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        onTap: (flush) {
          flush.dismiss(true);
          _handleMessage(message.data);
        },
      ).show(XCoordinator.context);
    });
  }

//  }
  static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.orange,
        )),
        payload: json.encode(message.data),
      );
    }
  }
}
