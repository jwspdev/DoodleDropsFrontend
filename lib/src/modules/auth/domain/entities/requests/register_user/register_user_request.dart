import 'package:equatable/equatable.dart';

class RegisterUserRequestEntity extends Equatable {
  final String email;
  final String password;

  const RegisterUserRequestEntity(
      {required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
