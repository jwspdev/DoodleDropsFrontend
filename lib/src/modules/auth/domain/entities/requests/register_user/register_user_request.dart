import 'package:equatable/equatable.dart';

class RegisterUserRequestEntity extends Equatable {
  final String email;
  final String password;
  final String? displayName;

  const RegisterUserRequestEntity(
      {required this.email, required this.password, this.displayName});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, displayName];
}
