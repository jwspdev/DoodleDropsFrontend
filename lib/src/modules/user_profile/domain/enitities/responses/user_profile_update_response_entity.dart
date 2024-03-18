// import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_profile_response.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_profile_response_entity.dart';
import 'package:equatable/equatable.dart';

class UserProfileUpdateResponseEntity extends Equatable {
  final String? message;
  final UserProfileResponseEntity? userProfileResponse;

  const UserProfileUpdateResponseEntity(
      {this.message, this.userProfileResponse});

  @override
  List<Object?> get props => [message ?? '', userProfileResponse ?? {}];
}
