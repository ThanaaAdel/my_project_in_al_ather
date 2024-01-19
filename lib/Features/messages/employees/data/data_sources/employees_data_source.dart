import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:HrmsVersions/core/utils/functions/setup_service_locator.dart';

import '../../../../../core/utils/network/api/network_api.dart';
import '../../../../../core/utils/network/network_request.dart';
import '../../../../../core/utils/network/network_utils.dart';
import '../models/employees/employees.dart';

typedef EmployeesResponse = Either<String, EmployeesList>;

abstract class EmployeesRemoteDataSource {
  Future<EmployeesResponse> fetchEmployees(String empId);
}

class EmployeesRemoteDataSourceImpl extends EmployeesRemoteDataSource {
  @override
  Future<EmployeesResponse> fetchEmployees(String empId) async {
    EmployeesResponse employeesResponse = left("");
    var body = {
      "page": "1",
      "per_page": "250",
      "emp_id": empId,
      "search_title": ""
    };
    await getIt<NetworkRequest>().requestFutureData<EmployeesModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEmployeesApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          employeesResponse = right(data.data!);
        } else {
          employeesResponse = left(data.toString());
        }
      },
      onError: (code, msg) {
        employeesResponse = left(code.toString());
      },
    );
    return employeesResponse;
  }
}
