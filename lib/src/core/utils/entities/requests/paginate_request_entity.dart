import 'package:equatable/equatable.dart';

class PaginateRequestEntity extends Equatable {
  final int pageNumber;
  final int limit;

  const PaginateRequestEntity({required this.pageNumber, required this.limit});

  @override
  List<Object?> get props => [pageNumber, limit];
}
