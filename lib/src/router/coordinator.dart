import 'package:fevent/src/feature/event/pages/event_detail_page.dart';
import 'package:fevent/src/feature/event/pages/holder_register_event_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_one_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_two_page.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/router/router_name.dart';
import 'package:flutter/material.dart';

class XCoordinator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentState!.context;
  static NavigatorState get navigator => navigatorKey.currentState!;
  static void pop<T extends Object?>([T? result]) async {
    return navigatorKey.currentState!.pop(result);
  }

  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      navigator.pushNamed(
        routeName,
        arguments: arguments,
      );

  static Future<T?> push<T extends Object?>(Widget screen) => navigator.push(
        MaterialPageRoute(builder: (context) => screen),
      );

  static Future showSignIn() => pushNamed(XRouterName.signIn);

  static Future logoutAndShowSignIn() => navigator.pushNamedAndRemoveUntil(
        XRouterName.signIn,
        (_) => false,
      );

  static Future showDashboard() => pushNamed(XRouterName.dashboard);

  static Future showProfile() => pushNamed(XRouterName.profile);
  static Future showUpdateProfile() => pushNamed(XRouterName.updateProfile);

  static Future showAllEvent() => pushNamed(XRouterName.eventAll);

  static Future showEventDetail(EventModel event) => push(EventDetailPage(
        event: event,
      ));

  static Future showEventHolder() => push(const HolderRegisterEventPage());

  static Future showEventOne() => push(const RegisterEventOnePage());
  static Future showEventTwo() => push(const RegisterEventTwoPage());

  static Future showScanQR() => pushNamed(XRouterName.scanQr);

  static Future showNotification() => pushNamed(XRouterName.notification);
}
