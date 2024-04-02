import 'package:doodle_drops/src/modules/posts/domain/entities/post_entity.dart';
import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';
import 'package:equatable/equatable.dart';

class PostWithExtrasEntity extends PostEntity {
  final PostCounterEntity? postCounter;
  final List<TagEntity>? tags;

  const PostWithExtrasEntity({
    required int id,
    String? title,
    required AuthorResponseEntity author,
    required this.postCounter,
    required this.tags,
  }) : super(id: id, author: author, title: title);
  @override
  List<Object?> get props => [id, author, postCounter, tags, title];
}

class PostCounterEntity extends Equatable {
  final int? commentCount;
  final int? userLikedCount;

  const PostCounterEntity({this.commentCount, this.userLikedCount});

  @override
  List<Object?> get props => [commentCount, userLikedCount];
}
