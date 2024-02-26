import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doodle_drops/src/core/resources/data_state.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/login_user/login_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/requests/register_user/register_user_request.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/auth_token.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/login_user/login_user_response.dart';
import 'package:doodle_drops/src/modules/auth/data/models/responses/register_user/register_user_response.dart';
import 'package:doodle_drops/src/modules/auth/domain/repositories/token_repository.dart';
import 'package:doodle_drops/src/modules/auth/domain/use_cases/auth_login_use_case.dart';
import 'package:doodle_drops/src/modules/auth/domain/use_cases/auth_register_use_case.dart';
import 'package:doodle_drops/src/modules/auth/presentation/state_management/auth_bloc/auth_enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLoginUseCase _authLoginUseCase;
  final AuthRegisterUseCase _authRegisterUseCase;
  final TokenRepository _tokenRepository;
  AuthBloc(
      this._authLoginUseCase, this._tokenRepository, this._authRegisterUseCase)
      : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginUserEvent>(_loginUser);
    on<CheckIfAuthenticatedEvent>(_checkIfAuthenticated);
    on<LogoutUserEvent>(_logOutUser);
    on<RegisterUserEvent>(_registerUser);
  }

  void _registerUser(RegisterUserEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
    RegisterUserRequest request =
        RegisterUserRequest(email: event.email, password: event.password);
    final authRegisterUser = await _authRegisterUseCase.call(params: request);

    if (authRegisterUser is DataSuccess) {
      RegisterUserResponse response = authRegisterUser.data;
      debugPrint('${response.message} ${response.data}');
      emit(RegisterSuccessState(response: authRegisterUser.data));
    } else {
      debugPrint('error: ${authRegisterUser.exception}');
      emit(AuthErrorState(authRegisterUser.exception));
    }
  }

  void _loginUser(LoginUserEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
    LoginUserRequest request =
        LoginUserRequest(email: event.email, password: event.password);

    final authLoginUser = await _authLoginUseCase.call(params: request);
    debugPrint('entered');
    debugPrint('$authLoginUser');
    if (authLoginUser is DataSuccess) {
      LoginUserResponse userData = authLoginUser.data;
      debugPrint('POTA: ${userData.token}');
      await _tokenRepository.writeToken('token', AuthToken(userData.token));
      emit(LoginSuccessState(response: userData));
      add(CheckIfAuthenticatedEvent());
    } else {
      emit(AuthErrorState(authLoginUser.exception));
    }
  }

  void _logOutUser(LogoutUserEvent event, Emitter<AuthState> emit) {
    _tokenRepository.deleteToken('token');
    debugPrint('logged out');
    emit(const AuthenticationState(
        authenticationStatus: AuthenticationStatus.unauthenticated));
  }

  void _checkIfAuthenticated(
      CheckIfAuthenticatedEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(authenticationStatus: AuthenticationStatus.unknown));

    Future<AuthToken?> tokenFuture =
        Future.value(_tokenRepository.readToken('token'));
    AuthToken? token = await tokenFuture;
    if (token != null) {
      String currentToken = token.token;

      debugPrint('authenticated');
      emit(AuthenticationState(
          authenticationStatus: AuthenticationStatus.authenticated,
          authToken: currentToken));
    } else {
      debugPrint('unauthenticated!');
      emit(const AuthenticationState(
          authenticationStatus: AuthenticationStatus.unauthenticated,
          authToken: ''));
    }
  }
  //check if user is loggedIn using an event, trigger the event by checking, if the token exists, return UserAuthState with loggedIn info, else return null with status as notLoggedIn
}
