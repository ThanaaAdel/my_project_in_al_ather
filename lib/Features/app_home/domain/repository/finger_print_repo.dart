import '../../data/dat_source/finger_print/_remote_data_source/finger_print_remote_data_source.dart';

abstract class FingerPrintRepository {
  Future<FingerPrintResponse> addFingerPrint(
      String empId, String branchId, String type, String lat, String long);
}
