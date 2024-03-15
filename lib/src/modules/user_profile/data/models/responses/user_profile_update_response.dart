import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_profile_response.dart';
import 'package:doodle_drops/src/modules/user_profile/domain/enitities/responses/user_profile_update_response_entity.dart';

class UserProfileUpdateResponse extends UserProfileUpdateResponseEntity {
  const UserProfileUpdateResponse(
      {String? message, UserProfileResponse? userProfileResponse})
      : super(message: message, userProfileResponse: userProfileResponse);
  factory UserProfileUpdateResponse.fromJson(Map<String, dynamic> map) {
    return UserProfileUpdateResponse(
        message: map['message'] ?? '',
        userProfileResponse: UserProfileResponse.fromJson(map['data'] ?? {}));
  }
}
