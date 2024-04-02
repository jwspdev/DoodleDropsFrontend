import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;
  final AuthorResponseEntity? author;
  final String? title;
  const PostEntity(
      {required this.id,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.title,
      this.author});

  @override
  List<Object?> get props =>
      [id, createdAt, updatedAt, description, author, title];
}

class AuthorResponseEntity extends Equatable {
  final int id;
  final String? displayName;

  const AuthorResponseEntity({required this.id, this.displayName});

  @override
  List<Object?> get props => [id, displayName];
}
