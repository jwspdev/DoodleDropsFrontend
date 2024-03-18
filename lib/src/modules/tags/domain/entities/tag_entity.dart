import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? tagType;

  const TagEntity({this.id, this.name, this.description, this.tagType});

  @override
  List<Object?> get props => [id, name, description, tagType];
}
