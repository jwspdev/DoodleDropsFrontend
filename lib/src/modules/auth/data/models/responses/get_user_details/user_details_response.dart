import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_profile_response.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_details_response_entity.dart';
import 'package:doodle_drops/src/modules/tags/data/models/tag_model.dart';

class UserDetailsResponse extends UserDetailsResponseEntity {
  const UserDetailsResponse({
    DateTime? updatedAt,
    String? email,
    UserProfileResponse? userProfileResponse,
    List<TagModel>? likedTags,
  }) : super(
            updatedAt: updatedAt,
            email: email,
            userProfileResponse: userProfileResponse,
            likedTags: likedTags);
  //From Json Mapper
  factory UserDetailsResponse.fromJson(Map<String, dynamic> map) {
    List<TagModel>? likedTags;
    if (map['liked_tags'] != null) {
      likedTags = List<TagModel>.from(
          map['liked_tags'].map((tagMap) => TagModel.fromJson(tagMap)));
    }
    return UserDetailsResponse(
        updatedAt: DateTime.parse(map['updated_at']),
        email: map['email'],
        userProfileResponse:
            UserProfileResponse.fromJson(map['user_profile'] ?? {}),
        likedTags: likedTags);
  }
}
