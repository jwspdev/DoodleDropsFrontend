import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/use_cases/base_use_case.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/requests/user_profile_update_request.dart';
import 'package:doodle_drops/src/modules/user_profile/domain/repositories/user_update_profile_repository.dart';

class UserUpdateProfileUseCase
    extends BaseUseCase<DataState<dynamic>, UserProfileUpdateRequest> {
  final UserUpdateProfileRepository _userUpdateProfileRepository;

  UserUpdateProfileUseCase(this._userUpdateProfileRepository);

  @override
  Future<DataState> call({UserProfileUpdateRequest? params, String? token}) {
    return _userUpdateProfileRepository.updateUserProfile(params!, token!);
  }
}
