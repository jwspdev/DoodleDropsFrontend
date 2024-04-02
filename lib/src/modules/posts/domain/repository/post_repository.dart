import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/utils/entities/requests/paginate_request_entity.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/modules/posts/data/models/requests/post_list_request.dart';
import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_list_response_entity.dart';

abstract class PostRepository {
  Future<DataState<PostListResponseEntity>> getPostList(
      String token, PostListRequest request);
}
