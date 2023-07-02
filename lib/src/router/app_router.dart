import 'package:fevent/src/feature/dashboard/pages/dashboard_page.dart';
import 'package:fevent/src/feature/event/pages/all_event_page.dart';
import 'package:fevent/src/feature/login/pages/login_page.dart';
import 'package:fevent/src/feature/profile/pages/profile_page.dart';
import 'package:fevent/src/feature/profile/pages/update_profile_page.dart';
import 'package:fevent/src/router/router_name.dart';
import 'package:fevent/src/widgets/not_found_page.dart';
import 'package:flutter/material.dart';

class XAppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XRouterName.signIn:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case XRouterName.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case XRouterName.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case XRouterName.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfilePage());
      case XRouterName.eventAll:
        return MaterialPageRoute(builder: (_) => const AllEventPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
