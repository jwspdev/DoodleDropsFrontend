import 'package:doodle_drops/src/core/resources/data_state.dart';
// import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_details_response_entity.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_response_entity.dart';

abstract class UserDetailsRepository {
  Future<DataState<UserResponseEntity>> getCurrentUserDetails(String token);
}
