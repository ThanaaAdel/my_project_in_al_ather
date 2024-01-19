import '../../data/dat_source/finger_print/_remote_data_source/finger_print_remote_data_source.dart';
import '../entities/finger_print_entity.dart';
import '../repository/finger_print_repo.dart';

abstract class UseCase<type> {
  Future<FingerPrintResponse> call(
      String empId, String branchId, String type, String lat, String long);
}

class FingerPrintUseCase extends UseCase<FingerPrintEntity> {
  final FingerPrintRepository fingerPrintRepository;
  FingerPrintUseCase(this.fingerPrintRepository);

  @override
  Future<FingerPrintResponse> call(String empId, String branchId, String type,
      String lat, String long) async {
    return await fingerPrintRepository.addFingerPrint(
        empId, branchId, type, lat, long);
  }
}
