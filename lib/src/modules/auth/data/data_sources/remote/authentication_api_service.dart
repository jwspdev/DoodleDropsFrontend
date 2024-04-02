import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/utils/constants.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/login_user/login_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/register_user/register_user_request.dart';
// import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_details_response.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/get_user_details/user_response.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/login_user/login_user_response.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/register_user/register_user_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:doodle_drops/src/modules/auth/utils/constants.dart';

part 'authentication_api_service.g.dart';

@RestApi(baseUrl: DOODLE_DROPS_ENDPOINT)
abstract class AuthenticationApiService {
  factory AuthenticationApiService(Dio dio) = _AuthenticationApiService;

  //user signup
  @POST("$USER_BASE_PATH/signup")
  Future<HttpResponse<RegisterUserResponse>> register(
      @Body() RegisterUserRequest registerUserRequest);

  @POST("$USER_BASE_PATH/login")
  Future<HttpResponse<LoginUserResponse>> login(
      @Body() LoginUserRequest loginUserRequest);

  @GET("$USER_BASE_PATH/get/current")
  Future<HttpResponse<UserResponse>> getCurrentUserDetails(
      @Header('Authorization') String authentication);
}
