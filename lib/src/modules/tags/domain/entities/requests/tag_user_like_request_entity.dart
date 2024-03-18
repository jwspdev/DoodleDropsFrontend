// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TagUserLikeRequestEntity extends Equatable {
  final List<int> tagIds;
  const TagUserLikeRequestEntity({
    required this.tagIds,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [tagIds];
}
