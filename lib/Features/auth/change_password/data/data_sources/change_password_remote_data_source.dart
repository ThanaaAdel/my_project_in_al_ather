import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../core/utils/network/api/network_api.dart';
import '../../../../../core/utils/network/network_utils.dart';
import '../../domain/entities/change_password_entity.dart';
import '../models/change_password_model/change_password_model.dart';

typedef ChangePasswordResponse = Either<String, ChangePasswordEntity>;

abstract class ChangePasswordRemoteDataSource {
  Future<ChangePasswordResponse> changePassword(
    String userId,
    String currentPassword,
    String newPassword,
  );
}

class ChangePasswordRemoteDataSourceImpl
    extends ChangePasswordRemoteDataSource {
  @override
  Future<ChangePasswordResponse> changePassword(
    String userId,
    String currentPassword,
    String newPassword,
  ) async {
    ChangePasswordResponse changePasswordResponse = left("");

    var body = {
      "user_id": userId,
      "current_pass": currentPassword,
      "user_pass": newPassword,
    };
    await getIt<NetworkRequest>().requestFutureData<ChangePasswordModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerChangePasswordApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          changePasswordResponse = right(data);
        } else {
          changePasswordResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        changePasswordResponse = left(code.toString());
      },
    );
    return changePasswordResponse;
  }
}
