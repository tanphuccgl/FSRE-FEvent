class Endpoints {
  Endpoints._();

  // base url

  static const String baseUrl =
      "https://eventsuppport.monoinfinity.net/api/v1.0";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // endpoints
  static const String event = "$baseUrl/events";
  static const String getEvent = "$baseUrl/events";
  static const String google = "$baseUrl/auth/google/callback";
  static const String logout = "$baseUrl/auth/logout";

  static const String getFavouriteEvent = "$baseUrl/interests/event";
  static const String postFavouriteEvent = "$baseUrl/interests";
  static const String removeFavouriteEvent = "$baseUrl/interests";

  static const String wallet = "$baseUrl/wallet/me";
  static const String transaction = "$baseUrl/wallet/me/transaction";
  static const String withdraw = "$baseUrl/wallet/withdraw";
  static const String deposit = "$baseUrl/wallet/deposit/momo";

  static const String postRegisterEvent = "$baseUrl/participants";
  static const String deleteRegisterEvent = "$baseUrl/participants";

  static String checkRegisterEvent(eventId) =>
      "$baseUrl/participants/event/$eventId/me";

  static const String jobs = "$baseUrl/jobs";

  static const String profile = "$baseUrl/students/me";
  static const String updateProfile = "$baseUrl/students";

  static const String getInterestsMe = "$baseUrl/interests/me";

  static const String getparticipantsMe = "$baseUrl/participants/me";

  static const String getParticipantsByEventStatusFinished =
      "$baseUrl/participants/event/status/me?status=FINISHED";

  static const String getParticipantsByEventStatusUpcomming =
      "$baseUrl/participants/event/status/me?status=UPCOMMING";

  static const String postdonations = "$baseUrl/donations";

  static const String getJobRequestMeAccept =
      "$baseUrl/job-requests/me/status?status=ACCEPT";
  static const String getJobRequestMePending =
      "$baseUrl/job-requests/me/status?status=PENDING";

  static const String myDonation = "$baseUrl/donations/me";
}
