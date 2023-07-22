import 'package:fevent/bloc_observer.dart';
import 'package:fevent/fcm_config.dart';
import 'package:fevent/firebase_options.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/theme/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ConfigApp {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);
    _locator();
    await UserPrefs.instance.initialize();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    Bloc.observer = XBlocObserver();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FCM.config();
  }

  static void _locator() {
    GetIt.I.registerLazySingleton(() => Domain());
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  await FCM.config();
  FCM.showFlutterNotification(message);
}
