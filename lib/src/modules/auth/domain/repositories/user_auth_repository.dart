import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/login_user/login_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/register_user/register_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/login_user/login_user_response.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/register_user/register_user_response.dart';

abstract class UserAuthRepository {
  Future<DataState<LoginUserResponse>> getUserToken(LoginUserRequest request);
  Future<DataState<RegisterUserResponse>> registerUser(
      RegisterUserRequest request);
}
