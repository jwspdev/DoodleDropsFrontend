import 'package:doodle_drops/src/modules/auth/domain/entities/requests/login_user/login_user_request.dart';

class LoginUserRequest extends LoginUserRequestEntity {
  const LoginUserRequest({required String email, required String password})
      : super(email: email, password: password);

  //from Json Mapper
  factory LoginUserRequest.fromJson(Map<String, dynamic> map) {
    return LoginUserRequest(
        email: map['email'] ?? '', password: map['password'] ?? '');
  }

  //to Json mapper
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
