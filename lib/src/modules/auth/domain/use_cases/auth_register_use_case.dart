import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/use_cases/base_use_case.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/register_user/register_user_request.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/user_auth_repository.dart';

class AuthRegisterUseCase
    extends BaseUseCase<DataState<dynamic>, RegisterUserRequest> {
  final UserAuthRepository _authRepository;
  AuthRegisterUseCase(this._authRepository);

  @override
  Future<DataState> call({RegisterUserRequest? params}) {
    return _authRepository.registerUser(params!);
  }
}
