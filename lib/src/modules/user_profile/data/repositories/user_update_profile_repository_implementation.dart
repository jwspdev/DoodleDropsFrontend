import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/modules/user_profile/data/data_sources/remote/user_api_service.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/requests/user_profile_update_request.dart';
import 'package:doodle_drops/src/modules/user_profile/data/models/responses/user_profile_update_response.dart';
// import 'package:doodle_drops/src/modules/user_profile/domain/enitities/requests/user_profile_update_request_entity.dart';
// import 'package:doodle_drops/src/modules/user_profile/domain/enitities/responses/user_profile_update_response_entity.dart';
// import 'package:doodle_drops/src/modules/user_profile/domain/enitities/responses/user_profile_update_response_entity.dart';
import 'package:doodle_drops/src/modules/user_profile/domain/repositories/user_update_profile_repository.dart';
// import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';

class UserUpdateProfileRepositoryImplementation
    implements UserUpdateProfileRepository {
  final UserApiService _userApiService;

  UserUpdateProfileRepositoryImplementation(this._userApiService);

  @override
  Future<DataState<UserProfileUpdateResponse>> updateUserProfile(
      UserProfileUpdateRequest userProfileUpdateRequest, String? token) async {
    try {
      final HttpResponse<UserProfileUpdateResponse> response =
          await _userApiService.updateProfile(
              userProfileUpdateRequest, token ?? '');
      if (response.response.statusCode == HttpStatus.ok) {
        UserProfileUpdateResponse updateResponse = response.data;
        return DataSuccess(updateResponse);
      } else {
        return DataFailure(DioException(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions));
      }
    } on DioException catch (e) {
      debugPrint('error user details: $e');
      return DataFailure(e);
    }
  }
}
