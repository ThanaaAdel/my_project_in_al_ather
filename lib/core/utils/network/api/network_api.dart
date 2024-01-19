class Api {
  //base Url

  static const String mainAppUrl = "https://alatheer.site/abnaa/qr_c/";

  static const String baseUrl = "${mainAppUrl}New_api/";

  static const String doServerLoginApiCall = "login_by_mobile";
  static const String doFireBasePhoneTokenApiCall = "insert_update_token";
  static const String doFingerPrintApiCall = "attendance";
  static const String doNewMessageCall = "save_message";
  static const String doServerTablesApiCall = "hdoor_table";
  static const String doServerGetMessagesApiCall = "get_messages";
  static const String doServerCalenderApiCall = "report_calender";
}

class NewApi {
  static const String mainAppUrl = "https://alatheer.site/abnaa/";
  static const String baseUrl = "${mainAppUrl}Api/";

  static const String doServerLoginApiCall = "login_app";
  static const String doServerRegisterApiCall = "register";
  static const String doServerChangePasswordApiCall = "update_pass";

  static const String doServerSendMessageApiCall = "SendMessage";
  static const String doServerAllMessageApiCall = "InboxMessages";
  static const String doServerSentMessageApiCall = "SentMessages";

  static const String doServerMessageDetailsApiCall = "ViewMessage";
  static const String doServerEmployeesApiCall = "AllEmplyees";
  static const String doServerSeenMessageApiCall = "SeenMessage";
  static const String doServerDeleteMessageApiCall = "DeleteMessage";

  static const String doServerAboutAppApiCall = "getAppinfo";
  static const String doServerPrivacyAndPolicyCall = "getAppPolicy";
}
