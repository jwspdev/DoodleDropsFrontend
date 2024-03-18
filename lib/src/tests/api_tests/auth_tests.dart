import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/local/secured_storage_service.dart';
import 'package:doodle_drops/src/modules/auth/data/data_sources/remote/authentication_api_service.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/login_user/login_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/register_user/register_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/repositories/token_repository_implementation.dart';
import 'package:doodle_drops/src/modules/auth/data/repositories/user_auth_repository_impl.dart';
import 'package:doodle_drops/src/modules/auth/data/repositories/user_details_repository_implementation.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/token_repository.dart';
import 'package:doodle_drops/src/modules/auth/domain/use_cases/user_details_use_case.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

//SELF MADE TESTING HEHE

class AuthTests {
  static void testGetCurrentUser() async {
    final dio = Dio();
    final authService = AuthenticationApiService(dio);

    final SecuredStorageService securedStorageService = SecuredStorageService();
    final TokenRepository tokenRepository =
        TokenRepositoryImplementation(securedStorageService);
    final UserDetailsRepositoryImplementation
        userDetailsRepositoryImplementation =
        UserDetailsRepositoryImplementation(authService);

    final UserDetailsUseCase userDetailsUseCase =
        UserDetailsUseCase(userDetailsRepositoryImplementation);
    const sampleToken =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTE3NzYxNzYsInN1YiI6OTF9.I0rxjoSPDAzeMP858VZj2BPGQ7jkstlrtEMvcNi4zl0";
    try {
      final response = await userDetailsUseCase
          .call(params: sampleToken)
          .then((value) => debugPrint('${value.data}'));
    } catch (error) {
      debugPrint('$error');
    }
  }

  static void testRegister() async {
    final dio = Dio();
    final authService = AuthenticationApiService(dio);

    try {
      const registerUserRequest = RegisterUserRequest(
          email: 'asdasdasdasd2',
          password: '123456',
          displayName: "testDisplayName");

      final response = await authService
          .register(registerUserRequest)
          .then((value) => debugPrint('POTRAGIS ${value.data}'));
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

  static testLogin() async {
    final dio = Dio();
    final authService = AuthenticationApiService(dio);
    final UserAuthRepositoryImplementation userAuthRepository =
        UserAuthRepositoryImplementation(authService);

    try {
      const loginUserRequest =
          LoginUserRequest(email: 'warren', password: 'ecinlodi');
      final response = await userAuthRepository.getUserToken(loginUserRequest);
      if (response is DataSuccess) {
        debugPrint(response.data!.message);
      } else {
        debugPrint('${response.exception}');
      }
    } catch (error) {
      debugPrint('Error $error');
    }
  }
}
