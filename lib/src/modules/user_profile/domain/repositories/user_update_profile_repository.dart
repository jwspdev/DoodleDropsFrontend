import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/requests/user_profile_update_request.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/responses/user_profile_update_response.dart';
import 'package:doodle_drops/src/modules/user_profile/domain/enitities/requests/user_profile_update_request_entity.dart';
import 'package:doodle_drops/src/modules/user_profile/domain/enitities/responses/user_profile_update_response_entity.dart';

abstract class UserUpdateProfileRepository {
  Future<DataState<UserProfileUpdateResponse>> updateUserProfile(
      UserProfileUpdateRequest userProfileUpdateRequestEntity, String token);
}
