import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/use_cases/base_use_case.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/login_user/login_user_request.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/user_auth_repository.dart';

class AuthLoginUseCase
    extends BaseUseCase<DataState<dynamic>, LoginUserRequest> {
  final UserAuthRepository _authRepository;
  AuthLoginUseCase(this._authRepository);

  @override
  Future<DataState> call({LoginUserRequest? params}) {
    return _authRepository.getUserToken(params!);
  }
}
