// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;
  // final LoginUserRequest loginUserRequest;
  const LoginUserEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterUserEvent extends AuthEvent {
  final String email;
  final String password;
  final String? displayName;
  const RegisterUserEvent(
      {required this.email, required this.password, this.displayName});

  @override
  List<Object> get props => [email, password, displayName!];
}

class LogoutUserEvent extends AuthEvent {}

class CheckIfAuthenticatedEvent extends AuthEvent {}
