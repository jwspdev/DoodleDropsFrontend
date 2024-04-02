import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/utils/constants.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/modules/posts/data/models/requests/post_list_request.dart';
import 'package:doodle_drops/src/modules/posts/data/models/responses/post_list_response.dart';
import 'package:doodle_drops/src/modules/posts/utils/constants.dart';
import 'package:retrofit/retrofit.dart';
part 'post_api_service.g.dart';

@RestApi(baseUrl: DOODLE_DROPS_ENDPOINT)
abstract class PostApiService {
  factory PostApiService(Dio dio) = _PostApiService;

  //list posts
  @GET("$POST_BASE_PATH/list")
  Future<HttpResponse<PostListResponse>> getListPost(
      @Header('Authorization') String authorization,
      @Body() PostListRequest postListRequest);

  //List current user's posts
  @GET("$POST_BASE_PATH/list/liked")
  Future<HttpResponse<PostListResponse>> getLikedPost(
      @Header('Authorization') String authorization,
      @Body() PaginateRequest paginateRequest);
}
