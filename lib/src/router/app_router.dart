import 'package:fevent/src/feature/login/pages/login_page.dart';
import 'package:fevent/src/router/router_name.dart';
import 'package:fevent/src/widgets/not_found_page.dart';
import 'package:flutter/material.dart';

class XAppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
     
      case XRouterName.signIn:
        return MaterialPageRoute(builder: (_) => const LoginPage());
     
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
