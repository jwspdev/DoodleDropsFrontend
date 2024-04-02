import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/modules/posts/domain/entities/requests/post_list_request_entity.dart';

class PostListRequest extends PostListRequestEntity {
  final PaginateRequest paginateRequest;
  const PostListRequest({
    int? userID,
    required this.paginateRequest,
  }) : super(userID: userID, paginateRequestEntity: paginateRequest);

  //to Json Mapper
  Map<String, dynamic> toJson() {
    return {'user_id': userID, 'paginate_request': paginateRequest.toJson()};
  }
}
