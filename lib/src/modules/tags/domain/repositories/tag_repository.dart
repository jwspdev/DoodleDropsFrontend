import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/core/utils/models/responses/message_response.dart';
import 'package:doodle_drops/src/modules/tags/data/models/requests/tag_user_like_request.dart';
import 'package:doodle_drops/src/modules/tags/data/models/responses/tag_list_response.dart';

abstract class TagRepository {
  Future<DataState<TagListResponse>> getTagsList(
      String token, PaginateRequest request);
  Future<DataState<MessageResponse>> likeTagByUser(
      String token, TagUserLikeRequest request);
}
