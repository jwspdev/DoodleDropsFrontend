import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/remote/authentication_api_service.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/auth_token.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_response_entity.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/token_repository.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/user_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

class UserDetailsRepositoryImplementation implements UserDetailsRepository {
  final AuthenticationApiService _authenticationApiService;

  UserDetailsRepositoryImplementation(this._authenticationApiService);

  @override
  Future<DataState<UserResponseEntity>> getCurrentUserDetails(
      String? token) async {
    try {
      if (token != null) {
        final HttpResponse<UserResponseEntity> response =
            await _authenticationApiService.getCurrentUserDetails(token);
        if (response.response.statusCode == HttpStatus.ok) {
          final userResponse = response.data;
          // debugPrint('$userResponse');
          return DataSuccess(userResponse);
        } else {
          return DataFailure(DioException(
              error: response.response.statusMessage,
              response: response.response,
              type: DioExceptionType.badResponse,
              requestOptions: response.response.requestOptions));
        }
      } else {
        return DataFailure(Exception("Token is null"));
      }
      // debugPrint('$token');
    } on DioException catch (e) {
      debugPrint('error user details: $e');
      return DataFailure(e);
    }
  }
}
