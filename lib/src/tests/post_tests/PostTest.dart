import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/utils/models/requests/paginate_request.dart';
import 'package:doodle_drops/src/core/utils/params/paginate_params.dart';
import 'package:doodle_drops/src/modules/posts/data/data_sources/post_api_service.dart';
import 'package:doodle_drops/src/modules/posts/data/models/requests/post_list_request.dart';
import 'package:doodle_drops/src/modules/posts/data/repositories/post_repository_impl.dart';
import 'package:doodle_drops/src/modules/posts/domain/use_case/list_post_use_case.dart';
import 'package:flutter/material.dart';

class PostTest {
  static void testGetPostList() async {
    final dio = Dio();
    final PostApiService postApiService = PostApiService(dio);
    final PostRepositoryImplementaion repository =
        PostRepositoryImplementaion(postApiService);
    final ListPostUseCase useCase = ListPostUseCase(repository);
    const sampleToken =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTI4MTEzMDAsInN1YiI6OTF9.ZEPvYZ2lm4p6GYqlqZrlEIXE3ZA42mmOubcInsHdXtU';
    debugPrint('TEST GET LIST: $sampleToken');
    try {
      var paginateRequest = PaginateRequest(pageNumber: 1, limit: 5);
      var request =
          PostListRequest(userID: 91, paginateRequest: paginateRequest);
      debugPrint('TEST GET LIST REQUEST: $request');
      // PaginateParams params = PaginateParams(sampleToken, paginateRequest);
      postApiService
          .getListPost(sampleToken, request)
          .then((value) => debugPrint('${value.data}'));
      //     .then((value) => debugPrint('TEST API SERVICE: ${value.data}'));

      // repository
      //     .getPostList(sampleToken, paginateRequest)
      //     .then((value) => debugPrint('FROM POST REPO: ${value.data}'));

      // useCase
      //     .call(params: params)
      //     .then((value) => debugPrint('FROM USE CASE TEST: ${value.data}'));
    } catch (error) {
      debugPrint('ERROR SA POST: $error');
    }
  }

  static void testGetUserLikedPost() {
    final dio = Dio();
    final PostApiService postApiService = PostApiService(dio);
    const sampleToken =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTI4MTEzMDAsInN1YiI6OTF9.ZEPvYZ2lm4p6GYqlqZrlEIXE3ZA42mmOubcInsHdXtU';
    var paginateRequest = PaginateRequest(pageNumber: 1, limit: 1);
    postApiService
        .getLikedPost(sampleToken, paginateRequest)
        .then((value) => debugPrint('${value.data}'));
  }
}
