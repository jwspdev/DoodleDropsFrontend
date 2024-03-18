part of 'tag_bloc.dart';

sealed class TagState extends Equatable {
  final List<TagEntity>? tagListResponse;
  final Exception? exception;
  const TagState({this.tagListResponse, this.exception});

  @override
  List<Object> get props => [tagListResponse ?? [], exception ?? Exception()];
}

final class TagInitial extends TagState {
  const TagInitial();
}

final class TagListRetrievedState extends TagState {
  const TagListRetrievedState({required List<TagEntity> tagListResponse})
      : super(tagListResponse: tagListResponse);
  @override
  List<Object> get props => [tagListResponse!];
}

final class TagErrorState extends TagState {
  const TagErrorState({super.exception});
  @override
  List<Object> get props => [exception!];
}

final class TagNoMoreDataState extends TagState {
  const TagNoMoreDataState();
}

final class UserLikeTagState extends TagState {
  final MessageResponseEntity messageResponse;

  const UserLikeTagState(this.messageResponse);

  @override
  List<Object> get props => [messageResponse];
}
