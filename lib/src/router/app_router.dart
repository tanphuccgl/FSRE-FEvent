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
import 'package:fevent/src/feature/login/pages/login_page.dart';
import 'package:fevent/src/feature/my_event/pages/my_event_page.dart';
import 'package:fevent/src/feature/profile/pages/profile_page.dart';
import 'package:fevent/src/feature/profile/pages/update_profile_page.dart';
import 'package:fevent/src/feature/scan/pages/scan_page.dart';
import 'package:fevent/src/feature/wallet/pages/wallet_page.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/network/model/job.dart';
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
      case XRouterName.scanQr:
        return MaterialPageRoute(builder: (_) => const ScanPage());
      case XRouterName.myEvent:
        return MaterialPageRoute(builder: (_) => const MyEventPage());

      case XRouterName.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfilePage());
      case XRouterName.eventAll:
        return MaterialPageRoute(
            builder: (_) => const AllEventPage(
                  list: [],
                ));
      case XRouterName.eventDetail:
        return MaterialPageRoute(
            builder: (_) => EventDetailPage(
                  event: EventModel(),
                ));

      case XRouterName.eventDetailDonate:
        return MaterialPageRoute(
            builder: (_) => DetailEventDonatePage(
                  event: EventModel(),
                ));
      case XRouterName.eventDetailTicket:
        return MaterialPageRoute(
            builder: (_) => DetailEventTicketPage(
                  event: EventModel(),
                ));
      case XRouterName.eventDetailTicketSucess:
        return MaterialPageRoute(
            builder: (_) => const SuccessEventTicketPage());

      case XRouterName.eventHolder:
        return MaterialPageRoute(
            builder: (_) => HolderRegisterEventPage(
                  event: EventModel(),
                ));
      case XRouterName.eventOne:
        return MaterialPageRoute(
            builder: (_) => RegisterEventOnePage(
                  event: EventModel(),
                ));
      case XRouterName.eventTwo:
        return MaterialPageRoute(
            builder: (_) => const RegisterEventTwoPage(eventId: ""));

      case XRouterName.eventDonate:
        return MaterialPageRoute(
            builder: (_) => DonateEventPage(
                  event: EventModel(),
                ));

      case XRouterName.wallet:
        return MaterialPageRoute(builder: (_) => const WalletPage());

      case XRouterName.listJob:
        return MaterialPageRoute(builder: (_) => const ListJobPage());
      case XRouterName.jobDetail:
        return MaterialPageRoute(
            builder: (_) => JobDetailPage(
                  data: JobData(),
                ));

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
