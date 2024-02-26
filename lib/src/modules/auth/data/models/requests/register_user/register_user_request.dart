import 'package:doodle_drops/src/modules/auth/domain/entities/requests/register_user/register_user_request.dart';

class RegisterUserRequest extends RegisterUserRequestEntity {
  const RegisterUserRequest({required String email, required String password})
      : super(email: email, password: password);

  //From Json Mapper
  factory RegisterUserRequest.fromJson(Map<String, dynamic> map) {
    return RegisterUserRequest(
        email: map['email'] ?? '', password: map['password'] ?? '');
  }

  //To Json Mapper
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
