import 'package:dio/dio.dart';
import 'package:doodle_drops/src/modules/user_profile/data/data_sources/remote/user_api_service.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/requests/user_profile_update_request.dart';
import 'package:doodle_drops/src/modules/user_profile/data/repositories/user_update_profile_repository_implementation.dart';
import 'package:doodle_drops/src/modules/user_profile/domain/use_cases/user_update_profile_use_case.dart';
import 'package:flutter/material.dart';

class UserTests {
  static void testUpdateUser() async {
    final dio = Dio();
    final userRemoteService = UserApiService(dio);
    final UserUpdateProfileRepositoryImplementation repo =
        UserUpdateProfileRepositoryImplementation(userRemoteService);
    final UserUpdateProfileUseCase _useCase = UserUpdateProfileUseCase(repo);
    const token =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTE3NzYxNzYsInN1YiI6OTF9.I0rxjoSPDAzeMP858VZj2BPGQ7jkstlrtEMvcNi4zl0';

    final UserProfileUpdateRequest request = UserProfileUpdateRequest(
        displayName: "TEST",
        firstName: "FROM",
        middleName: "USE",
        lastName: "CASE",
        age: 69,
        birthday: DateTime.now());
    await _useCase
        .call(params: request, token: token)
        .then((value) => debugPrint('${value.data}'));
    // await repo
    //     .updateUserProfile(request, authToken)
    //     .then((value) => debugPrint('TEST FROM REPO: ${value.data}'));
    // await userRemoteService
    //     .updateProfile(request, authToken)
    //     .then((value) => debugPrint('TEST FROM API CALL: ${value.data}'));
  }
}
