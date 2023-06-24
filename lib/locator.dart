import 'package:fevent/bloc_observer.dart';
import 'package:fevent/src/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigApp {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);
    _locator();
    await Future.wait([
      // Firebase.initializeApp(),
      // AnalyticsService.instance.init(),

      // UserPrefs.instance.initialize(),
    ]);

    Bloc.observer = XBlocObserver();
  }

  static void _locator() {
    // GetIt.I..registerLazySingleton(() => Domain());
  }
}
