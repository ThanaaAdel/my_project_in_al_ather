// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/entities/change_password_entity.dart';
import '../../../domain/use_cases/change_password_use_case.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;
  bool isLoading = false;

  ChangePasswordCubit(this.changePasswordUseCase)
      : super(ChangePasswordInitial());

  Future<void> changePassword(
    String userId,
    String currentPassword,
    String newPassword,
  ) async {
    emit(const ChangePasswordLoading());
    final result = await changePasswordUseCase.call(
      userId,
      currentPassword,
      newPassword,
    );

    emit(result.fold(
      ChangePasswordFailed.new,
      ChangePasswordSuccessful.new,
    ));
  }
}
