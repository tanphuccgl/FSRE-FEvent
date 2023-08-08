import 'package:bot_toast/bot_toast.dart';

import 'package:fevent/src/router/app_router.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/router/route_observer.dart';
import 'package:fevent/src/router/router_name.dart';
import 'package:fevent/src/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/feature/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: XCoordinator.navigatorKey,
            initialRoute: XRouterName.signIn,
            onGenerateRoute: XAppRoute.onGenerateRoute,
            navigatorObservers: [XRouteObserver()],
            builder: (context, child) {
              child = botToastBuilder(context, child);

              return child;
            },
            theme: XTheme.light(),
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: true,
          );
        },
        rebuildFactor: (old, data) => RebuildFactors.all(old, data),
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
      ),
    );
  }
}
