class Endpoints {
  Endpoints._();

  // base url
  //static const String baseUrl = "https://apidemo.ut.edu.vn/api";

  //TODO update api prod
  static const String baseUrl = "https://utapi.ut.edu.vn/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // endpoints
  static const String login = "$baseUrl/login";
  static const String getInfoAccount = "$baseUrl/getinfoaccount";
  static const String logout = "$baseUrl/logout";
  static const String getInfoTeacher = "$baseUrl/getinfoteacher";
  static const String getInfoStudent = "$baseUrl/getinfostudent";

  //work schedule
  static const String getListWorkSchedule = "$baseUrl/getlistworkschedule";
  static const String getWorksSheduleContent =
      "$baseUrl/getworkschedulecontent";
  static const String getListOtherWorkSchedule =
      "$baseUrl/getlistotherworkschedule";
  static const String getOtherWorksSheduleContent =
      "$baseUrl/getotherworkschedulecontent";

  //department
  static const String getListDepartment = "$baseUrl/getlistdepartment";
  static const String getListEmailPhoneByDepartment =
      "$baseUrl/getlistemailphonebydepartment";
  static const String getEmailPhoneByDepartmentWithId =
      "$baseUrl/getemailphonebydepartmentwithid";

  //news
  static const String getListNews = "$baseUrl/getlistnews";
  static const String getNewsContent = "$baseUrl/getnewscontent";

  //message
  static const String getListMessage = "$baseUrl/getlistmessage";
  static const String getMessageContent = "$baseUrl/getmessagecontent";
  static const String getListMessageSent = "$baseUrl/getlistmessagesent";
  static const String getUnreadMessageNumber =
      "$baseUrl/getunreadmessagenumber";
}
