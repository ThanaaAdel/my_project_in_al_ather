// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../../../data/models/table_model/datum.dart';
import '../../../domain/use_case/table_use_case.dart';
part 'attendance_table_state.dart';

class AttendanceTableCubit extends Cubit<AttendanceTableState> {
  TableUseCase tableUseCase;
  AttendanceTableCubit(this.tableUseCase) : super(FetchInitial());

  Future<void> getTableData(
    String fromDate,
    String toDate,
    String empId,
  ) async {
    emit(const FetchLoading());
    final result = await tableUseCase.call(fromDate, toDate, empId);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}

// import 'package:bloc/bloc.dart';

// import '../../domain/entities/login_entity.dart';
// import '../../domain/use_cases/login_use_case.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final LoginUseCase loginRequest;
//   bool isLoading = false;

//   LoginCubit(this.loginRequest) : super(LoginInitial());

//   Future<void> getUserData(String phone) async {
//     emit(const LoginLoading());
//     final result = await loginRequest.call(phone);
//     result.fold((failure) {
//       emit(LoginFailed(failure.message));
//       print(failure.message);
//     }, (loginEntity) {
//       emit(LoginSuccessful(loginEntity));
//       print(loginEntity.id);
//     });
//   }
// }
