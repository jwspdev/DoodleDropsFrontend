import 'package:equatable/equatable.dart';

class RegisterUserResponseDataEntity extends Equatable {
  final String email;
  final String? displayName;
  const RegisterUserResponseDataEntity({required this.email, this.displayName});

  @override
  List<Object?> get props => [email, displayName];
}
