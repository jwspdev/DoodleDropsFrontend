import 'package:equatable/equatable.dart';

class LoginUserResponseEntity extends Equatable {
  final String message;
  final String token;

  const LoginUserResponseEntity({required this.message, required this.token});

  @override
  List<Object?> get props => [message, token];
}
