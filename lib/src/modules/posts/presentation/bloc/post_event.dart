part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostListEvent extends PostEvent {
  final int? userId;
  const GetPostListEvent({this.userId});
  @override
  List<Object> get props => [userId!];
}

class LoadMorePostEvent extends PostEvent {
  const LoadMorePostEvent();
}
