import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/use_cases/base_use_case.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/user_details_repository.dart';

class UserDetailsUseCase extends BaseUseCase<DataState<dynamic>, String> {
  final UserDetailsRepository _userDetailsRepository;

  UserDetailsUseCase(this._userDetailsRepository);

  @override
  Future<DataState> call({String? params}) {
    return _userDetailsRepository.getCurrentUserDetails(params!);
  }
}
