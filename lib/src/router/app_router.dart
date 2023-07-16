import 'package:fevent/src/feature/dashboard/pages/dashboard_page.dart';
import 'package:fevent/src/feature/event/pages/all_event_page.dart';
import 'package:fevent/src/feature/event/pages/event_detail_page.dart';
import 'package:fevent/src/feature/event/pages/holder_register_event_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_one_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_two_page.dart';
import 'package:fevent/src/feature/login/pages/login_page.dart';
import 'package:fevent/src/feature/profile/pages/profile_page.dart';
import 'package:fevent/src/feature/profile/pages/update_profile_page.dart';
import 'package:fevent/src/feature/wallet/pages/wallet_page.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
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
      case XRouterName.eventDetail:
        return MaterialPageRoute(
            builder: (_) => EventDetailPage(
                  event: EventModel(),
                ));
      case XRouterName.eventHolder:
        return MaterialPageRoute(
            builder: (_) => const HolderRegisterEventPage());
      case XRouterName.eventOne:
        return MaterialPageRoute(builder: (_) => const RegisterEventOnePage());
      case XRouterName.eventTwo:
        return MaterialPageRoute(builder: (_) => const RegisterEventTwoPage());

      case XRouterName.wallet:
        return MaterialPageRoute(builder: (_) => const WalletPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
