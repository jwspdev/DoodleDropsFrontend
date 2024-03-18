import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';

class TagModel extends TagEntity {
  const TagModel({
    int? id,
    String? name,
    String? description,
    String? tagType,
  }) : super(id: id, name: name, description: description, tagType: tagType);

  factory TagModel.fromJson(Map<String, dynamic> map) {
    return TagModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      tagType: map['tag_type'] ?? '',
    );
  }
}
