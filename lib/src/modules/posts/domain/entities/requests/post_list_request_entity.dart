import 'package:doodle_drops/src/core/utils/entities/requests/paginate_request_entity.dart';
import 'package:equatable/equatable.dart';

class PostListRequestEntity extends Equatable {
  final int? userID;
  final PaginateRequestEntity paginateRequestEntity;

  const PostListRequestEntity(
      {this.userID, required this.paginateRequestEntity});

  @override
  List<Object?> get props => [userID, paginateRequestEntity];
}
