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
import 'package:fevent/src/feature/feedback/pages/feedback_page.dart';
import 'package:fevent/src/feature/job_request/pages/job_request_page.dart';
import 'package:fevent/src/feature/login/pages/login_page.dart';
import 'package:fevent/src/feature/my_donation/pages/my_donation_page.dart';
import 'package:fevent/src/feature/my_event/pages/my_event_page.dart';
import 'package:fevent/src/feature/profile/pages/profile_page.dart';
import 'package:fevent/src/feature/profile/pages/update_profile_page.dart';
import 'package:fevent/src/feature/scan/pages/scan_page.dart';
import 'package:fevent/src/feature/search/pages/search_page.dart';
import 'package:fevent/src/feature/wallet/pages/wallet_page.dart';
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
            builder: (_) => const EventDetailPage(eventId: ""));

      case XRouterName.eventDetailDonate:
        return MaterialPageRoute(
            builder: (_) => const DetailEventDonatePage(
                  eventId: "",
                ));
      case XRouterName.eventDetailTicket:
        return MaterialPageRoute(
            builder: (_) => const DetailEventTicketPage(eventId: ""));
      case XRouterName.eventDetailTicketSucess:
        return MaterialPageRoute(
            builder: (_) => const SuccessEventTicketPage());

      case XRouterName.eventHolder:
        return MaterialPageRoute(
            builder: (_) => const HolderRegisterEventPage(
                  eventId: "",
                ));
      case XRouterName.eventOne:
        return MaterialPageRoute(
            builder: (_) => const RegisterEventOnePage(
                  eventId: "",
                ));
      case XRouterName.eventTwo:
        return MaterialPageRoute(
            builder: (_) => const RegisterEventTwoPage(eventId: ""));

      case XRouterName.eventDonate:
        return MaterialPageRoute(
            builder: (_) => const DonateEventPage(
                  eventId: "",
                ));

      case XRouterName.wallet:
        return MaterialPageRoute(builder: (_) => const WalletPage());

      case XRouterName.listJob:
        return MaterialPageRoute(
            builder: (_) => const ListJobPage(
                  eventId: "",
                ));
      case XRouterName.jobDetail:
        return MaterialPageRoute(
            builder: (_) => JobDetailPage(
                  data: JobData(),
                ));

      case XRouterName.jobRequest:
        return MaterialPageRoute(builder: (_) => const JobRequestPage());

      case XRouterName.myDonation:
        return MaterialPageRoute(builder: (_) => const MyDonationPage());
      case XRouterName.feedback:
        return MaterialPageRoute(
            builder: (_) => const FeedbackPage(
                  eventId: "",
                ));

      case XRouterName.search:
        return MaterialPageRoute(builder: (_) => const SearchPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
