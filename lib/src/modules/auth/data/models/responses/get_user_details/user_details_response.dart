import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_profile_response.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_details_response_entity.dart';

class UserDetailsResponse extends UserDetailsResponseEntity {
  const UserDetailsResponse(
      {DateTime? updatedAt,
      String? email,
      UserProfileResponse? userProfileResponse})
      : super(
            updatedAt: updatedAt,
            email: email,
            userProfileResponse: userProfileResponse);
  //From Json Mapper
  factory UserDetailsResponse.fromJson(Map<String, dynamic> map) {
    return UserDetailsResponse(
        updatedAt: DateTime.parse(map['updated_at']),
        email: map['email'],
        userProfileResponse:
            UserProfileResponse.fromJson(map['user_profile'] ?? {}));
  }
}
