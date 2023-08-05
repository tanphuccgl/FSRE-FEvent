import 'package:fevent/src/feature/dashboard/pages/dashboard_page.dart';
import 'package:fevent/src/feature/event/pages/all_event_page.dart';
import 'package:fevent/src/feature/event/pages/detail_event_donate_page.dart';

import 'package:fevent/src/feature/event/pages/detail_event_ticket_page.dart';
import 'package:fevent/src/feature/event/pages/donate_event_page.dart';
import 'package:fevent/src/feature/event/pages/event_detail_page.dart';
import 'package:fevent/src/feature/event/pages/holder_register_event_page.dart';
import 'package:fevent/src/feature/event/pages/job_detail_page.dart';
import 'package:fevent/src/feature/event/pages/list_job_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_one_page.dart';
import 'package:fevent/src/feature/event/pages/register_event_two_page.dart';
import 'package:fevent/src/feature/event/pages/success_event_ticket_page.dart';
import 'package:fevent/src/feature/job_request/pages/job_request_page.dart';
import 'package:fevent/src/feature/my_donation/pages/my_donation_page.dart';
import 'package:fevent/src/feature/my_event/pages/my_event_page.dart';
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

  static Future showMyEvent() => push(const MyEventPage());
  static Future showUpdateProfile() => pushNamed(XRouterName.updateProfile);

  static Future showAllEvent(List<EventModel> list) =>
      push(AllEventPage(list: list));

  static Future<void> showEventDetail(EventModel event) async {
    if (((event.categories ?? [])
                .singleWhere((e) => e.categoryName == "DONATION",
                    orElse: () => Categories(categoryId: ""))
                .categoryId ??
            "")
        .isNotEmpty) {
      push(DetailEventDonatePage(eventId: event.eventId ?? ""));
    } else if (((event.categories ?? [])
                .singleWhere((e) => e.categoryName == "TICKET",
                    orElse: () => Categories(categoryId: ""))
                .categoryId ??
            "")
        .isNotEmpty) {
      push(DetailEventTicketPage(eventId: event.eventId ?? ""));
    } else {
      push(EventDetailPage(eventId: event.eventId ?? ""));
    }
  }

  static Future showEventHolder(String eventId) => push(HolderRegisterEventPage(
        eventId: eventId,
      ));

  static Future showEventOne(String eventId) => push(RegisterEventOnePage(
        eventId: eventId,
      ));
  static Future showEventTwo(String eventId) =>
      push(RegisterEventTwoPage(eventId: eventId));
  static Future showEventDonate(String eventId) => push(DonateEventPage(
        eventId: eventId,
      ));

  static Future showEventTicketSuccess() =>
      push(const SuccessEventTicketPage());

  static Future showListJob() => push(const ListJobPage());

  static Future showJobDetail(JobData event) => push(JobDetailPage(
        data: event,
      ));
  static Future showEventDetail1(String eventId) async {
    navigator.pop();
    navigator.pop();
    navigator.pop();
    navigator.pop();
    navigator.push(
      MaterialPageRoute(
          builder: (context) => EventDetailPage(
                eventId: eventId,
              )),
    );
  }

  static Future showScanQR() => pushNamed(XRouterName.scanQr);

  static Future showNotification() => pushNamed(XRouterName.notification);

  static Future showJobRequestPage() => push(const JobRequestPage());

  static Future showMyDonationPage() => push(const MyDonationPage());
}
