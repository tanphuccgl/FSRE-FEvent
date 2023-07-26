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

  static const String wallet = "$baseUrl/wallet/me";
  static const String transaction = "$baseUrl/wallet/me/transaction";
  static const String withdraw = "$baseUrl/wallet/withdraw";
  static const String deposit = "$baseUrl/wallet/deposit/momo";

  static const String postRegisterEvent = "$baseUrl/participants";
  static String checkRegisterEvent(eventId) =>
      "$baseUrl/participants/event/$event/me";

  static const String jobs = "$baseUrl/jobs";
}
