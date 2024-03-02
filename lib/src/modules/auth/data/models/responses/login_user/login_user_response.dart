import 'package:doodle_drops/src/modules/auth/domain/entities/responses/login_user/login_user_response_entity.dart';

class LoginUserResponse extends LoginUserResponseEntity {
  const LoginUserResponse({required String message, required String token})
      : super(message: message, token: token);

  factory LoginUserResponse.fromJson(Map<String, dynamic> map) {
    return LoginUserResponse(
        message: map['message'] ?? '', token: map['token'] ?? '');
  }
}
