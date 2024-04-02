part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  final List<PostWithExtrasEntity>? posts;
  final Exception? exception;
  const PostState({this.posts, this.exception});

  @override
  List<Object> get props => [posts ?? {}, exception ?? {}];
}

final class PostInitial extends PostState {}

class PostLoadedState extends PostState {
  const PostLoadedState({required super.posts});
  @override
  List<Object> get props => [posts ?? {}];
}

class PostErrorState extends PostState {
  const PostErrorState({required super.exception});
  @override
  List<Object> get props => [exception ?? {}];
}
