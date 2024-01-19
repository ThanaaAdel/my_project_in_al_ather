import 'package:HrmsVersions/Features/privacy_and_policy/data/models/privacy_and_policy_model.dart';

import '../../../Features/about_app/data/models/about_app_model/about_app_model.dart';
import '../../../Features/app_home/data/models/finger_print_model/finger_print_model.dart';
import '../../../Features/auth/change_password/data/models/change_password_model/change_password_model.dart';
import '../../../Features/auth/fire_base_token/data/models/token_model.dart';
import '../../../Features/auth/login/data/models/login_model/login_model/login_model.dart';
import '../../../Features/auth/register/data/models/register_model/register_model.dart';
import '../../../Features/calender/data/models/calender_model/calender_model.dart';
import '../../../Features/messages/employees/data/models/employees/employees.dart';
import '../../../Features/messages/my_messages/data/models/delete_message_model.dart';
import '../../../Features/messages/my_messages/data/models/message_details_model/message_details_model.dart';
import '../../../Features/messages/my_messages/data/models/my_messages_model/my_messages_model.dart';
import '../../../Features/messages/my_messages/data/models/sent_messages_model/sent_messages_model.dart';
import '../../../Features/messages/send_message/data/models/send_message_model.dart';
import '../../../Features/table/data/models/table_model/table_model.dart';
import 'base_response/general_response.dart';
import 'net_response.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (T.toString() == "BaseResponse") {
      return BaseResponse.fromJson(json) as T;
    } else if (T.toString() == "GeneralResponse") {
      return GeneralResponse.fromJson(json) as T;
    } else if (T.toString() == "LoginModel") {
      return LoginModel.fromJson(json) as T;
    } else if (T.toString() == "TokenModel") {
      return TokenModel.fromJson(json) as T;
    } else if (T.toString() == "FingerPrintModel") {
      return FingerPrintModel.fromJson(json) as T;
    } else if (T.toString() == "TableModel") {
      return TableModel.fromJson(json) as T;
    } else if (T.toString() == "MyMessagesModel") {
      return MyMessagesModel.fromJson(json) as T;
    } else if (T.toString() == "SendMessageModel") {
      return SendMessageModel.fromJson(json) as T;
    } else if (T.toString() == "CalenderModel") {
      return CalenderModel.fromJson(json) as T;
    } else if (T.toString() == "RegisterModel") {
      return RegisterModel.fromJson(json) as T;
    } else if (T.toString() == "ChangePasswordModel") {
      return ChangePasswordModel.fromJson(json) as T;
    } else if (T.toString() == "SentMessagesModel") {
      return SentMessagesModel.fromJson(json) as T;
    } else if (T.toString() == "EmployeesModel") {
      return EmployeesModel.fromJson(json) as T;
    } else if (T.toString() == "MessageDetailsModel") {
      return MessageDetailsModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteMessageModel") {
      return DeleteMessageModel.fromJson(json) as T;
    } else if (T.toString() == "AboutAppModel") {
      return AboutAppModel.fromJson(json) as T;
    } else if (T.toString() == "PrivacyAndPolicyModel") {
      return PrivacyAndPolicyModel.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
