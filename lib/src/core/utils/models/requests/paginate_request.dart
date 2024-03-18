import 'package:doodle_drops/src/core/utils/entities/requests/paginate_request_entity.dart';

class PaginateRequest extends PaginateRequestEntity {
  PaginateRequest({required super.pageNumber, required super.limit});

  //to json mapper
  Map<String, dynamic> toJson() {
    return {
      'page_number': pageNumber,
      'limit': limit,
    };
  }
}
