import 'package:fevent/src/feature/my_user/pages/my_user_page.dart';
import 'package:fevent/src/router/base_coordinator.dart';
import 'package:fevent/src/widgets/not_found_page.dart';
import 'package:flutter/material.dart';

class XProfileRouterName {
  static const String myUser = '/my-user';
}

class MyUserCoordinator extends BaseCoordinator {
  @override
  @override
  String get initialRoute => XProfileRouterName.myUser;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XProfileRouterName.myUser:
        return MaterialPageRoute(builder: (_) => const MyUserPage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
