import 'package:equatable/equatable.dart';

class LoginUserRequestEntity extends Equatable {
  final String email;
  final String password;

  const LoginUserRequestEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
