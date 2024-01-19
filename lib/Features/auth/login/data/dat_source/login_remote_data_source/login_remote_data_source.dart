import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../domain/entities/login_entity.dart';
import '../../models/login_model/login_model/login_model.dart';

typedef LoginResponse = Either<String, LoginEntity>;

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(String phone, String password);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<LoginResponse> login(String phone, String password) async {
    LoginResponse loginResponse = left("");

    var body = {
      "mobile": phone.trim(),
      "user_pass": password,
    };
    await getIt<NetworkRequest>().requestFutureData<LoginModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerLoginApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          loginResponse = right(data);
        } else {
          loginResponse = left(data.toString());
        }
      },
      onError: (code, msg) {
        loginResponse = left(code.toString());
      },
    );
    return loginResponse;
  }
}
