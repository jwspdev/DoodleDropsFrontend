import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/remote/authentication_api_service.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/login_user/login_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/register_user/register_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/login_user/login_user_response.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/register_user/register_user_response.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/user_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';

class UserAuthRepositoryImplementation implements UserAuthRepository {
  final AuthenticationApiService _authenticationApiService;

  UserAuthRepositoryImplementation(this._authenticationApiService);
  @override
  Future<DataState<LoginUserResponse>> getUserToken(
      LoginUserRequest request) async {
    try {
      final HttpResponse<LoginUserResponse> response =
          await _authenticationApiService.login(request);
      if (response.response.statusCode == HttpStatus.ok) {
        final userResponse = response.data;
        return DataSuccess(userResponse);
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

  @override
  Future<DataState<RegisterUserResponse>> registerUser(
      RegisterUserRequest request) async {
    try {
      final HttpResponse<RegisterUserResponse> response =
          await _authenticationApiService.register(request);
      if (response.response.statusCode == HttpStatus.ok) {
        final registerResponse = response.data;
        return DataSuccess(registerResponse);
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
