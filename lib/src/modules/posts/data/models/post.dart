import 'package:doodle_drops/src/modules/posts/domain/entities/post_entity.dart';

class Post extends PostEntity {
  const Post(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.description,
      super.title,
      super.author});

  //from Json
  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
        id: map['id'] ?? 0,
        createdAt: DateTime.parse(map['created_at'] ?? DateTime.now()),
        updatedAt: DateTime.parse(map['updated_at'] ?? DateTime.now()),
        description: map['description'] ?? '',
        title: map['title'] ?? '',
        author: AuthorResponse.fromJson(map['author']));
  }
}

class AuthorResponse extends AuthorResponseEntity {
  const AuthorResponse({required super.id, super.displayName});

  //from Json
  factory AuthorResponse.fromJson(Map<String, dynamic> map) {
    return AuthorResponse(
        id: map['user_id'] ?? 0, displayName: map['display_name'] ?? '');
  }
}
