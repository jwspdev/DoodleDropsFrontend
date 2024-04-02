import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/use_cases/base_use_case.dart';
import 'package:doodle_drops/src/core/utils/params/paginate_params.dart';
import 'package:doodle_drops/src/modules/posts/data/models/requests/post_list_request.dart';
import 'package:doodle_drops/src/modules/posts/domain/repository/post_repository.dart';
import 'package:flutter/material.dart';

class ListPostUseCase extends BaseUseCase<DataState<dynamic>, PostListParams> {
  final PostRepository _postRepository;

  ListPostUseCase(this._postRepository);
  @override
  Future<DataState> call({PostListParams? params}) {
    debugPrint('USE CASE CALLED!');
    return _postRepository.getPostList(params!.token, params.request);
  }
}

class PostListParams {
  final String token;
  final PostListRequest request;

  PostListParams(this.token, this.request);
}
