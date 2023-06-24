import 'package:fevent/src/feature/profile/pages/profile_page.dart';
import 'package:fevent/src/router/base_coordinator.dart';
import 'package:fevent/src/widgets/not_found_page.dart';
import 'package:flutter/material.dart';

class XProfileRouterName {
  static const String home = '/profile';
}

class ProfileCoordinator extends BaseCoordinator {
  @override
  String get initialRoute => XProfileRouterName.home;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XProfileRouterName.home:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
