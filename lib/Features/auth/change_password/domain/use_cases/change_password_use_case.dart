import '../../data/data_sources/change_password_remote_data_source.dart';
import '../entities/change_password_entity.dart';
import '../repositories/change_password_repo.dart';

abstract class UseCase<type> {
  Future<ChangePasswordResponse> call(
    String userId,
    String currentPassword,
    String newPassword,
  );
}

class ChangePasswordUseCase extends UseCase<ChangePasswordEntity> {
  final ChangePasswordRepository changePasswordRepository;
  ChangePasswordUseCase(this.changePasswordRepository);

  @override
  Future<ChangePasswordResponse> call(
    String userId,
    String currentPassword,
    String newPassword,
  ) async {
    return await changePasswordRepository.changePassword(
      userId,
      currentPassword,
      newPassword,
    );
  }
}
