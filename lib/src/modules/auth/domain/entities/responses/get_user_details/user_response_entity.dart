import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_details_response.dart';
import 'package:equatable/equatable.dart';

class UserResponseEntity extends Equatable {
  final UserDetailsResponse? userDetailsResponse;
  const UserResponseEntity({this.userDetailsResponse});
  @override
  List<Object?> get props => [userDetailsResponse];
}
