import 'package:doodle_drops/src/modules/tags/data/models/tag_model.dart';
import 'package:equatable/equatable.dart';

class TagListResponseEntity extends Equatable {
  final int? page;
  final int? pageSize;
  final List<TagModel>? tags;
  final int? totalTags;

  const TagListResponseEntity(
      {this.page, this.pageSize, this.tags, this.totalTags});

  @override
  List<Object?> get props => [page, pageSize, tags, totalTags];
}
