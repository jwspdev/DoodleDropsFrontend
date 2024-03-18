import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/utils/constants.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/core/utils/models/responses/message_response.dart';
import 'package:doodle_drops/src/modules/auth/utils/constants.dart';
import 'package:doodle_drops/src/modules/tags/data/models/requests/tag_user_like_request.dart';
import 'package:doodle_drops/src/modules/tags/data/models/responses/tag_list_response.dart';
import 'package:doodle_drops/src/modules/tags/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'tag_api_service.g.dart';

@RestApi(baseUrl: DOODLE_DROPS_ENDPOINT)
abstract class TagApiService {
  factory TagApiService(Dio dio) = _TagApiService;

  //list tags
  @GET("$TAG_BASE_PATH/list")
  Future<HttpResponse<TagListResponse>> listTags(
      @Header('Authorization') String authentication,
      @Body() PaginateRequest paginateRequest);
  //relate tags with user (like tags)
  @POST("$TAG_BASE_PATH$USER_BASE_PATH/like")
  Future<HttpResponse<MessageResponse>> userLikeTag(
      @Header('Authorization') String authentication,
      @Body() TagUserLikeRequest request);
  //relate tags with post (tags of post)
}
