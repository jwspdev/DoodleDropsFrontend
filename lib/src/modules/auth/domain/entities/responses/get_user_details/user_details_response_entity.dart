import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_profile_response_entity.dart';
import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';
import 'package:equatable/equatable.dart';

class UserDetailsResponseEntity extends Equatable {
  final DateTime? updatedAt;
  final String? email;
  final int? id;
  final UserProfileResponseEntity? userProfileResponse;
  final List<TagEntity>? likedTags;

  const UserDetailsResponseEntity(
      {this.id,
      this.updatedAt,
      this.email,
      this.userProfileResponse,
      this.likedTags});

  @override
  List<Object?> get props =>
      [id, updatedAt, email, userProfileResponse, likedTags];
}
