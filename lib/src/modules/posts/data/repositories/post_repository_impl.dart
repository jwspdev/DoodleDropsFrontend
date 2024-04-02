// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/utils/entities/requests/paginate_request_entity.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/modules/posts/data/data_sources/post_api_service.dart';
import 'package:doodle_drops/src/modules/posts/data/models/requests/post_list_request.dart';
import 'package:doodle_drops/src/modules/posts/data/models/responses/post_list_response.dart';
import 'package:doodle_drops/src/modules/posts/domain/entities/responses/post_list_response_entity.dart';
import 'package:doodle_drops/src/modules/posts/domain/repository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';

class PostRepositoryImplementaion implements PostRepository {
  final PostApiService _postApiService;
  PostRepositoryImplementaion(
    this._postApiService,
  );
  @override
  Future<DataState<PostListResponseEntity>> getPostList(
      String token, PostListRequest request) async {
    try {
      final HttpResponse<PostListResponse> response =
          await _postApiService.getListPost(token, request);
      if (response.response.statusCode == HttpStatus.ok) {
        PostListResponse postListResponse = response.data;
        postListResponse.posts.forEach(
          (element) {
            debugPrint('SHIT: ${element}');
          },
        );
        return DataSuccess(postListResponse);
      } else {
        return DataFailure(DioException(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions));
      }
    } on DioException catch (e) {
      debugPrint('error: $e');
      return DataFailure(e);
    }
  }
}
