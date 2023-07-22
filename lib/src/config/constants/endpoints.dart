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
  static const String google = "$baseUrl/auth/google/callback";
  static const String logout = "$baseUrl/auth/logout";
}
