import 'package:bloc/bloc.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/utils/entities/responses/message_response_entity.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/core/utils/params/paginate_params.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/auth_token.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/token_repository.dart';
import 'package:doodle_drops/src/modules/tags/data/models/requests/tag_user_like_request.dart';
import 'package:doodle_drops/src/modules/tags/data/models/responses/tag_list_response.dart';
import 'package:doodle_drops/src/modules/tags/domain/entities/requests/tag_user_like_request_entity.dart';
import 'package:doodle_drops/src/modules/tags/domain/entities/tag_entity.dart';
import 'package:doodle_drops/src/modules/tags/domain/use_cases/tag_list_use_case.dart';
import 'package:doodle_drops/src/modules/tags/domain/use_cases/user_like_tags_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagListUseCase _tagListUseCase;
  final UserLikeTagsUseCase _userLikeTagsUseCase;
  final TokenRepository _tokenRepository;
  int page = 1;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TagBloc(
      this._tagListUseCase, this._tokenRepository, this._userLikeTagsUseCase)
      : super(TagInitial()) {
    scrollController.addListener(() {
      // debugPrint('$isLoadingMore');
      add(LoadMoreEvent());
    });
    on<TagEvent>((event, emit) {});
    on<GetTagList>(_listTags);
    on<LoadMoreEvent>(_loadMore);
    on<UserLikeTagEvent>(_onUserLikeTags);
  }

  void _listTags(GetTagList event, Emitter<TagState> emit) async {
    emit(TagInitial());
    PaginateRequest paginateRequest =
        PaginateRequest(pageNumber: page, limit: 8);
    Future<AuthToken?> tokenFuture =
        Future.value(_tokenRepository.readToken('token'));
    AuthToken? token = await tokenFuture;
    if (token != null) {
      String currentToken = 'Bearer ${token.token}';
      final tagResponse = await _tagListUseCase.call(
          params: PaginateParams(currentToken, paginateRequest));
      debugPrint('FROM TAG BLOC: ${tagResponse.data?.tags}');
      if (tagResponse is DataSuccess) {
        emit(TagListRetrievedState(tagListResponse: tagResponse.data?.tags));
      } else {
        emit(TagErrorState(exception: tagResponse.exception));
      }
    }
  }

  //TODO
  void _onUserLikeTags(UserLikeTagEvent event, Emitter<TagState> emit) async {
    AuthToken? token = await _onGetToken();
    if (token != null) {
      String currentToken = 'Bearer ${token.token}';
      TagUserLikeRequest request = TagUserLikeRequest(tagIds: event.tagRequest);
      UserLikeTagParams params = UserLikeTagParams(currentToken, request);

      var tagResponse = await _userLikeTagsUseCase.call(params: params);
      if (tagResponse is DataSuccess) {
        debugPrint('liked!');
        emit(UserLikeTagState(tagResponse.data));
      } else {
        debugPrint('error');
        emit(TagErrorState(exception: tagResponse.exception));
      }
    }
  }

  Future<AuthToken?> _onGetToken() async {
    Future<AuthToken?> tokenFuture =
        Future.value(_tokenRepository.readToken('token'));
    AuthToken? token = await tokenFuture;
    return token;
  }

  //TODO FIX LOAD MORE
  void _loadMore(LoadMoreEvent event, Emitter<TagState> emit) async {
    // if (!isLoadingMore) {
    debugPrint(
        'MAX: ${scrollController.position.maxScrollExtent} | current: ${scrollController.position.pixels}');

    AuthToken? token = await _onGetToken();

    if (token != null) {
      String currentToken = 'Bearer ${token.token}';
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        debugPrint('PASOK');
        isLoadingMore = true;
        page++;
        debugPrint('$isLoadingMore');
        //test for delay to see if the progress indicator appears.
        await Future.delayed(const Duration(seconds: 2));
        var tagResponse = await _tagListUseCase.call(
            params: PaginateParams(
                currentToken, PaginateRequest(pageNumber: page, limit: 8)));
        List<TagEntity> retrievedTags = tagResponse.data?.tags ?? [];
        List<TagEntity> cleanListOfTags = [...state.tagListResponse!];
        // debugPrint(';$isLoadingMore');
        if (retrievedTags.isNotEmpty) {
          debugPrint('may laman');
          for (TagEntity tag in retrievedTags) {
            if (!cleanListOfTags.contains(tag)) {
              cleanListOfTags.add(tag);
            }
          }

          emit(TagListRetrievedState(tagListResponse: [...cleanListOfTags]));
        }
        // isLoadingMore = false;
        debugPrint('POTA: $isLoadingMore');
        // else {
        //   debugPrint('entered');
        // isLoadingMore = false;
        //   // emit(TagListRetrievedState(tagListResponse: [...cleanListOfTags]));
        //   emit(TagListRetrievedState(tagListResponse: [...cleanListOfTags]));
        // }
      }
    }
  }
}
