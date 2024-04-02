// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/core/utils/params/paginate_params.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/auth_token.dart';
import 'package:doodle_drops/src/modules/posts/data/models/requests/post_list_request.dart';
import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_with_extras_entity.dart';
import 'package:equatable/equatable.dart';

import 'package:doodle_drops/src/modules/auth/domain/repositories/token_repository.dart';
// import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_list_response_entity.dart';
import 'package:doodle_drops/src/modules/posts/domain/use_case/list_post_use_case.dart';
import 'package:flutter/material.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ListPostUseCase _useCase;
  final TokenRepository _tokenRepository;
  int page = 1;
  PostBloc(
    this._useCase,
    this._tokenRepository,
  ) : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
    on<GetPostListEvent>(_onGetPostList);
  }

  _onGetPostList(GetPostListEvent event, Emitter<PostState> emit) async {
    emit(PostInitial());
    PaginateRequest paginateRequest =
        PaginateRequest(pageNumber: page, limit: 15);
    Future<AuthToken?> tokenFuture =
        Future.value(_tokenRepository.readToken('token'));
    AuthToken? token = await tokenFuture;
    if (token != null) {
      String currentToken = 'Bearer ${token.token}';
      PostListParams params = PostListParams(
          currentToken,
          PostListRequest(
              userID: event.userId, paginateRequest: paginateRequest));
      debugPrint('USER ID: ${event.userId}');
      final postResponse = await _useCase.call(params: params);
      // debugPrint('FROM POST BLOC: ${postResponse.data}');

      if (postResponse is DataSuccess) {
        emit(PostLoadedState(posts: postResponse.data?.posts ?? []));
      } else {
        emit(PostErrorState(exception: postResponse.exception));
      }
    }
  }

  _onGetUserPosts(GetPostListEvent event, Emitter<PostState> emit) async {}
}
