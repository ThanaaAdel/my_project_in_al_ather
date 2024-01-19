import '../../data/dat_source/login_remote_data_source/login_remote_data_source.dart';
import '../entities/login_entity.dart';
import '../repository/login_repo.dart';

abstract class UseCase<type> {
  Future<LoginResponse> call(String phone, String password);
}

class LoginUseCase extends UseCase<LoginEntity> {
  final LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);

  @override
  Future<LoginResponse> call(String phone, String password) async {
    return await loginRepository.login(phone, password);
  }
}
