import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_profile_response_entity.dart';
import 'package:equatable/equatable.dart';

class UserDetailsResponseEntity extends Equatable {
  final DateTime? updatedAt;
  final String? email;
  final UserProfileResponseEntity? userProfileResponse;

  const UserDetailsResponseEntity(
      {this.updatedAt, this.email, this.userProfileResponse});

  @override
  List<Object?> get props => [updatedAt, email, userProfileResponse];
}
