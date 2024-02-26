part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final AuthenticationStatus? authenticationStatus;
  final String? authToken;
  const AuthState({this.authenticationStatus, this.authToken});
  @override
  List<Object> get props => [authenticationStatus ?? '', authToken ?? ''];
}

//loading
final class AuthInitial extends AuthState {
  const AuthInitial({super.authToken, super.authenticationStatus});
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class LoginSuccessState extends AuthState {
  final LoginUserResponse response;
  final String? token;

  const LoginSuccessState({required this.response, this.token});
  @override
  List<Object> get props => [response, token ?? ''];
}

final class RegisterSuccessState extends AuthState {
  final RegisterUserResponse response;

  const RegisterSuccessState(
      {super.authenticationStatus, super.authToken, required this.response});
  @override
  List<Object> get props => [response];
}

final class AuthErrorState extends AuthState {
  final DioException? exception;

  const AuthErrorState(this.exception);
  @override
  List<Object> get props => [exception!];
}

final class AuthenticationState extends AuthState {
  const AuthenticationState({super.authToken, super.authenticationStatus});
  @override
  List<Object> get props => [authenticationStatus!, authToken ?? ''];
}
