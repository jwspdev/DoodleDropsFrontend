import 'package:doodle_drops/src/modules/posts/data/models/responses/post_with_extras.dart';
import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_list_response_entity.dart';

class PostListResponse extends PostListResponseEntity {
  const PostListResponse(
      {required super.page,
      required super.pageSize,
      required super.posts,
      required super.totalPosts});
  factory PostListResponse.fromJson(Map<String, dynamic> map) {
    List<PostWithExtras>? postWithExtras;
    if (map['posts'] != null) {
      postWithExtras = List<PostWithExtras>.from(
          map['posts'].map((post) => PostWithExtras.fromJson(post)));
    }
    return PostListResponse(
        page: map['page'] ?? 0,
        pageSize: map['pageSize'] ?? 0,
        posts: postWithExtras ?? [],
        totalPosts: map['totalPosts'] ?? 0);
  }
}
