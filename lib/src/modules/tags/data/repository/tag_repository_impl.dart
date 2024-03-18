import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/core/utils/models/responses/message_response.dart';
import 'package:doodle_drops/src/modules/tags/data/data_sources/remote/tag_api_service.dart';
import 'package:doodle_drops/src/modules/tags/data/models/requests/tag_user_like_request.dart';
import 'package:doodle_drops/src/modules/tags/data/models/responses/tag_list_response.dart';
import 'package:doodle_drops/src/modules/tags/domain/repositories/tag_repository.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

class TagRepositoryImplementation implements TagRepository {
  final TagApiService _tagApiService;

  TagRepositoryImplementation(this._tagApiService);
  @override
  Future<DataState<TagListResponse>> getTagsList(
      String token, PaginateRequest request) async {
    try {
      final HttpResponse<TagListResponse> response =
          await _tagApiService.listTags(token, request);
      if (response.response.statusCode == HttpStatus.ok) {
        // debugPrint('TEST USE CASE: ${response.data}');
        return DataSuccess(response.data);
      } else {
        return DataFailure(DioException(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions));
      }
    } on DioException catch (e) {
      debugPrint('error retrieving tags: $e');
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<MessageResponse>> likeTagByUser(
      String token, TagUserLikeRequest request) async {
    try {
      final HttpResponse<MessageResponse> response =
          await _tagApiService.userLikeTag(token, request);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailure(DioException(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions));
      }
    } on DioException catch (e) {
      debugPrint('error liking tags: $e');
      return DataFailure(e);
    }
  }
}
