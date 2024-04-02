import 'package:doodle_drops/src/modules/tags/data/models/tag_model.dart';
import 'package:doodle_drops/src/modules/tags/domain/entities/responses/tag_list_response_entity.dart';

class TagListResponse extends TagListResponseEntity {
  const TagListResponse(
      {super.page, super.pageSize, super.tags, super.totalTags});

  //from json mapper
  factory TagListResponse.fromJson(Map<String, dynamic> map) {
    List<TagModel>? tags;
    if (map['tags'] != null) {
      tags = List<TagModel>.from(
          map['tags'].map((tagMap) => TagModel.fromJson(tagMap)));
    }
    var tagResponse = TagListResponse(
        page: map['page'] ?? 0,
        pageSize: map['page_size'] ?? 0,
        tags: tags,
        totalTags: map['total_tags'] ?? 0);
    return tagResponse;
  }
}
