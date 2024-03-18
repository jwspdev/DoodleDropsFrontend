part of 'tag_bloc.dart';

sealed class TagEvent extends Equatable {
  const TagEvent();

  @override
  List<Object> get props => [];
}

class GetTagList extends TagEvent {
  const GetTagList();
}

class LoadMoreEvent extends TagEvent {
  const LoadMoreEvent();
}

class UserLikeTagEvent extends TagEvent {
  final List<int> tagRequest;

  const UserLikeTagEvent({required this.tagRequest});
  @override
  List<Object> get props => [tagRequest];
}
