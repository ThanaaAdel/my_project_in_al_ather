import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../models/finger_print_model/finger_print_model.dart';
import '../../../../domain/entities/finger_print_entity.dart';

typedef FingerPrintResponse = Either<String, FingerPrintEntity>;

abstract class FingerPrintRemoteDataSource {
  Future<FingerPrintResponse> addFingerPrint(
      String empId, String branchId, String type, String lat, String long);
}

class FingerPrintRemoteDataSourceImpl extends FingerPrintRemoteDataSource {
  @override
  Future<FingerPrintResponse> addFingerPrint(String empId, String branchId,
      String type, String lat, String long) async {
    FingerPrintResponse fingerPrintResponse = left("");

    var body = {
      'emp_id_fk': empId,
      "branch_id": branchId,
      "type": type,
      "lat": lat,
      "long": long,
    };
    await getIt<NetworkRequest>().requestFutureData<FingerPrintModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: Api.doFingerPrintApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          fingerPrintResponse = right(data);
        } else {
          fingerPrintResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        fingerPrintResponse = left(msg.toString());
      },
    );
    return fingerPrintResponse;

    // var loginData = await apiService.fingerPrintPost(
    //     endPoint: "/attendance",
    //     branchId: branchId,
    //     empId: empId,
    //     long: long,
    //     lat: lat,
    //     type: type);
    // FingerPrintModel.fromJson(loginData);
    // FingerPrintEntity fingerPrintEntity = FingerPrintModel.fromJson(loginData);

    // return fingerPrintEntity;

    //     var loginData = await apiService.loginPost(
    //     endPoint: "/login_by_mobile", mobileNumber: phone);

    // LoginEntity yy = loginData.data;
    // return yy;
  }
}
