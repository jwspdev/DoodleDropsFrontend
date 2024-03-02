import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_details_response.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_response_entity.dart';

class UserResponse extends UserResponseEntity {
  const UserResponse({UserDetailsResponse? userDetailsResponse})
      : super(userDetailsResponse: userDetailsResponse);

  factory UserResponse.fromJson(Map<String, dynamic> map) {
    return UserResponse(
        userDetailsResponse: UserDetailsResponse.fromJson(map['user'] ?? {}));
  }
}
