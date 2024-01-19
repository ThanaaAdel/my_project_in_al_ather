import '../dat_source/finger_print/_remote_data_source/finger_print_remote_data_source.dart';
import '../../domain/repository/finger_print_repo.dart';

class FingerPrintRepoImpl extends FingerPrintRepository {
  final FingerPrintRemoteDataSource fingerPrintRemoteDataSource;

  FingerPrintRepoImpl(this.fingerPrintRemoteDataSource);
  @override
  Future<FingerPrintResponse> addFingerPrint(String empId, String branchId,
      String type, String lat, String long) async {
    var fingerPrintData = await fingerPrintRemoteDataSource.addFingerPrint(
        empId, branchId, type, lat, long);

    return fingerPrintData;
  }
}
