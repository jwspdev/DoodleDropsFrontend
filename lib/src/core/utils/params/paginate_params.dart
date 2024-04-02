import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:equatable/equatable.dart';

class PaginateParams extends Equatable {
  final String token;
  final PaginateRequest request;

  const PaginateParams(this.token, this.request);

  @override
  // TODO: implement props
  List<Object?> get props => [token, request];
}
