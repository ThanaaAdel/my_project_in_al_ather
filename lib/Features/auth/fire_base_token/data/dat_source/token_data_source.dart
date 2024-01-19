import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../core/utils/network/api/network_api.dart';
import '../../../../../core/utils/network/network_request.dart';
import '../../../../../core/utils/network/network_utils.dart';
import '../../../login/domain/entities/login_entity.dart';
import '../models/token_model.dart';

typedef TokenResponse = Either<String, String>;

abstract class TokenRemoteDataSource {
  Future<TokenResponse> getToken(String token);
}

class TokenRemoteDataSourceImpl extends TokenRemoteDataSource {
  @override
  Future<TokenResponse> getToken(String token) async {
    TokenResponse tokenResponse = left("");
    var box = Hive.box<LoginEntity>(kEmployeeDataBox);

    var body = {
      "emp_id_fk": box.get(kEmployeeDataBox) != null
          ? box.get(kEmployeeDataBox)!.employeeId
          : "",
      "token": token.trim(),
    };
    await getIt<NetworkRequest>().requestFutureData<TokenModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: Api.doFireBasePhoneTokenApiCall,
      onSuccess: (data) {
        if (data.status == 200) {
          tokenResponse = right(data.message!);
        } else {
          tokenResponse = left(data.toString());
        }
      },
      onError: (code, msg) {
        tokenResponse = left(code.toString());
      },
    );
    return tokenResponse;
  }
}
