// urls
import 'package:flutter/material.dart';

const fetchLimit = 10;
const baseUrl = "https://www.googleapis.com/books/v1/i";

// Routes
const String initialRoute = '/';
const String kHomeScreen = '/homeScreen';
const String kBookDetailsScreen = '/bookDetailsScreen';
const String kSearchScreen = '/searchScreen';
const String kIntroScreen = '/introScreen';
const String kBookLanguageScreen = '/bookLanguageScreen';
const String kRegisterScreen = "/registerScreen";
const String kVerificationScreen = "/verificationScreen";
const String kTapBarScreen = "/tapBarScreen";
const String kRejectedTapScreen = "/rejectedTapScreen";
const String kUpComingTapScreen = "/upcomingTapScreen";
const String kCurrentTapScreen = "/currentTapScreen";
const String kDataTableScreen = "/dataTableScreen";
const String kButtonNav = '/KBottomNav';
const String kRequestStatusScreen = '/kRequestStatusScreen';
const String kAppHomeScreen = '/kAppHomeScreen';
const String kFollowingRequestScreen = '/kFollowingRequestScreen';
const String kCustomStepper = '/kCustomStepper';

const String kLanguageScreenRoute = '/bookLanguageScreen';
const String kLoginScreenRoute = "/kLoginScreen";
const String kBottomNavRoute = '/KBottomNav';
const String kMyOrdersScreenRoute = '/kMyOrdersScreen';
const String kContactUsScreenRoute = '/kContactUsScreen';
const String kEditProfileScreenRoute = '/kEditProfileScreen';
const String kVacationRequestScreenRoute = '/kVacationRequestScreen';
const String kPermissionRequestScreenRoute = '/kPermissionRequestScreen';
const String kPersonalAccountScreenRoute = '/kPersonalAccountScreen';
const String kDeptRequestScreenRoute = '/kDeptRequestScreen';
const String kMessagesScreenRoute = '/kMessagesScreen';
const String kNewMessageScreenRoute = '/kNewMessageScreen';
const String kNotificationScreenRoute = '/kNotificationScreen';
const String kEmployeeProfileFormScreenStep2Route =
    '/kEmployeeProfileFormScreenStep2';
const String kChangeBankAccountScreenStep2Route =
    '/kChangeBankAccountScreenStep2';
const String kForgetPasswordScreenRoute = '/kForgetPasswordScreen';
const String kChangePasswordScreenRoute = '/kChangePasswordScreen';
const String kMessageDetailsViewRoute = '/kMessageDetailsView';
const String kPrivecyAndPolicyViewRoute = '/kPrivacyAndPolicyView';

// saved sharedPreference
const String locale = 'locale';
const String idEmployee = 'idEmployee';
const String timeIn = 'timeIn';
const String timeOut = 'timeOut';
const String timeDiff = 'timeDiff';

const String english = 'en';
const String arabic = 'ar';

//color
const Color kPrimaryColor = Color(0xff2c61d3);
const Color kSecondaryColor = Color(0xFF729BF1);
const Color kTextColor = Color(0xff7a7a7a);
const Color kOutPutContainerTextColor = Color(0xffABABAC);
const Color kPinCodeTextFieldColor = Color(0xffE8E8E8);
const Color kSettingIconsColor = Color(0xff707070);

const kTransitionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
const kHacenTunisia = 'Hacen Tunisia';
const kFeaturedBox = 'featured_box';
const kNewestBox = 'newest_box';
const kEmployeeDataBox = 'employee_data_box';
const kFingerPrintDataBox = 'finger_print_data_box';
const kTableDataBox = 'table_data_box';

const int kPersonalAccountScreen = 0;
const int kMessagesView = 1;
const int kNotificationView = 2;
const int kMyOrdersView = 3;
const int kHomeViews = 4;
const int kRequestVacationScreen = 5;
const int kRequestDeptScreen = 6;
const int kRequestPermissionScreen = 7;
const int kStatusRequest = 8;
const int kEmployeeProfileFormScreenStep1 = 9;
const int kPaymentPermissionScreen = 10;
const int kEmployeesProfileFormScreenStep2 = 11;
const int kNewMessageView = 12;
const int kDataTableView = 13;
const int kOrderDetailsScreen = 14;
const int kFollowingRequestsScreen = 15;
const int kChangeBankAccountViewStep1 = 16;
const int kChangeBankAccountViewStep2 = 17;
const int kEditProfileScreen = 18;
const int kContactsUsScreen = 19;
const int kNotificationScreen = 20;
const int kAboutAppView = 21;
const int kCalenderView = 22;
const int kMessagesDetailsView = 23;
const int kPrivecyAndPolicyView = 24;

class AppConstant {
  static const String appName = "LMS";
  static const String mainDir = "/";
  static const String favorite = "favorite";
  static const String data = "data";
  static const String message = "message";
  static const String code = "code";

  static const bool inProduction = bool.fromEnvironment("dart.vm.product");
  static const imageBaseUrl = "https://alatheer.site/abnaa/";
  static const String appLogoPath = "assets/images/ic_arabic_cafe_logo.png";

  static const String mapApi = "AIzaSyB8gvoP_4UBFjZOzicPbGTlg4JCco4MyjI";
  static const String tapApiKeyLive = "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ";

  // static const String tapApiKeyLive = "sk_live_hmeV3DftBxIdnPTi5ar8S9zw";
  // ignore: constant_identifier_names
  static const String privacy =
      'https://pages.flycricket.io/zaheyapp/privacy.html';

  // ignore: non_constant_identifier_names
  static var SOURCE_LOGIN = "LOGIN";
}
