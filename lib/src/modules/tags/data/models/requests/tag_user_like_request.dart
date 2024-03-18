import 'package:doodle_drops/src/modules/tags/domain/entities/requests/tag_user_like_request_entity.dart';

class TagUserLikeRequest extends TagUserLikeRequestEntity {
  const TagUserLikeRequest({required List<int> tagIds}) : super(tagIds: tagIds);

  Map<String, dynamic> toJson() {
    return {'tag_ids': tagIds};
  }
}
