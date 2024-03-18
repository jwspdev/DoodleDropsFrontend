import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/utils/constants.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/requests/user_profile_update_request.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/responses/user_profile_update_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:doodle_drops/src/modules/auth/utils/constants.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: DOODLE_DROPS_ENDPOINT)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  //update user profile
  @POST("$USER_BASE_PATH/profile/update")
  Future<HttpResponse<UserProfileUpdateResponse>> updateProfile(
      @Body() UserProfileUpdateRequest userProfileUpdateRequest,
      @Header('Authorization') String authentication);
}
