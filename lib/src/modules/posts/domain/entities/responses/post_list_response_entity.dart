import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_with_extras_entity.dart';
import 'package:equatable/equatable.dart';

class PostListResponseEntity extends Equatable {
  final int page;
  final int pageSize;
  final List<PostWithExtrasEntity> posts;
  final int totalPosts;

  const PostListResponseEntity(
      {required this.page,
      required this.pageSize,
      required this.posts,
      required this.totalPosts});

  @override
  List<Object?> get props => [page, pageSize, posts, totalPosts];
}
