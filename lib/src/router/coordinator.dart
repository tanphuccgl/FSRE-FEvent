import 'package:fevent/src/feature/dashboard/pages/dashboard_page.dart';
import 'package:fevent/src/feature/event/pages/detail_event_donate_page.dart';
import 'package:fevent/src/feature/event/pages/donate_event_page.dart';
import 'package:fevent/src/feature/event/pages/event_detail_page.dart';
import 'package:fevent/src/feature/event/pages/holder_register_event_page.dart';
import 'package:fevent/src/feature/event/pages/job_detail_page.dart';
import 'package:fevent/src/feature/event/pages/list_job_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_one_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_two_page.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/network/model/job.dart';
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

  static Future replaceDashboard() => navigator.pushReplacement(
      MaterialPageRoute(builder: (_) => const DashboardPage()));

  static Future showProfile() => pushNamed(XRouterName.profile);
  static Future showUpdateProfile() => pushNamed(XRouterName.updateProfile);

  static Future showAllEvent() => pushNamed(XRouterName.eventAll);

  static Future showEventDetail(EventModel event) => push(DetailEventDonatePage(
        event: event,
      ));

  static Future showEventHolder(EventModel event) =>
      push(HolderRegisterEventPage(
        event: event,
      ));

  static Future showEventOne(EventModel event) => push(RegisterEventOnePage(
        event: event,
      ));
  static Future showEventTwo(String eventId) =>
      push(RegisterEventTwoPage(eventId: eventId));
  static Future showEventDonate(EventModel event) => push(DonateEventPage(
        event: event,
      ));
  static Future showListJob() => push(const ListJobPage());

  static Future showJobDetail(JobData event) => push(JobDetailPage(
        data: event,
      ));
  static Future showEventDetail1(EventModel event) async {
    navigator.pop();
    navigator.pop();
    navigator.pop();
    navigator.pop();
    navigator.push(
      MaterialPageRoute(
          builder: (context) => EventDetailPage(
                event: event,
              )),
    );
  }

  static Future showScanQR() => pushNamed(XRouterName.scanQr);

  static Future showNotification() => pushNamed(XRouterName.notification);
}
