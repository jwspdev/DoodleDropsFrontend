import 'package:equatable/equatable.dart';

class RegisterUserResponseDataEntity extends Equatable {
  final String email;

  const RegisterUserResponseDataEntity({required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}
