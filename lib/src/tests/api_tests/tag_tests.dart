import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/modules/tags/data/data_sources/remote/tag_api_service.dart';
import 'package:doodle_drops/src/modules/tags/data/models/requests/tag_user_like_request.dart';
import 'package:doodle_drops/src/modules/tags/data/repository/tag_repository_impl.dart';
import 'package:doodle_drops/src/modules/tags/domain/repositories/tag_repository.dart';
import 'package:doodle_drops/src/modules/tags/domain/use_cases/tag_list_use_case.dart';
import 'package:doodle_drops/src/modules/tags/domain/use_cases/user_like_tags_use_case.dart';
import 'package:flutter/material.dart';

class TagTest {
  static void testUserLikeTags() async {
    final dio = Dio();
    final TagApiService tagApiService = TagApiService(dio);
    final TagRepositoryImplementation tagRepo =
        TagRepositoryImplementation(tagApiService);
    final UserLikeTagsUseCase _useCase = UserLikeTagsUseCase(tagRepo);
    try {
      var request = TagUserLikeRequest(tagIds: [1, 2]);
      const sampleToken =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTI4MTEzMDAsInN1YiI6OTF9.ZEPvYZ2lm4p6GYqlqZrlEIXE3ZA42mmOubcInsHdXtU';
      await _useCase
          .call(params: UserLikeTagParams(sampleToken, request))
          .then((value) => debugPrint('${value.data}'));
    } catch (error) {
      debugPrint('error from usecase: $error');
    }
  }

  static void listTags() async {
    final dio = Dio();
    final TagApiService tagApiService = TagApiService(dio);
    final TagRepositoryImplementation tagRepo =
        TagRepositoryImplementation(tagApiService);
    final TagListUseCase useCase = TagListUseCase(tagRepo);

    try {
      var request = PaginateRequest(pageNumber: 1, limit: 5);
      const sampleToken =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTI4MTEzMDAsInN1YiI6OTF9.ZEPvYZ2lm4p6GYqlqZrlEIXE3ZA42mmOubcInsHdXtU';
      await useCase
          .call(params: TagListParams(sampleToken, request))
          .then((value) => debugPrint('${value.data}'));
    } catch (error) {
      debugPrint('error from usecase: $error');
    }

    // try {
    //   var paginateRequest = PaginateRequest(pageNumber: 1, limit: 5);
    //   const sampleToken =
    //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTI4MTEzMDAsInN1YiI6OTF9.ZEPvYZ2lm4p6GYqlqZrlEIXE3ZA42mmOubcInsHdXtU';
    //   await tagApiService
    //       .listTags(sampleToken, paginateRequest)
    //       .then((value) => debugPrint('TAG TEST: ${value.data}'));
    // } catch (error) {
    //   debugPrint('error: $error');
    // }
  }
}
