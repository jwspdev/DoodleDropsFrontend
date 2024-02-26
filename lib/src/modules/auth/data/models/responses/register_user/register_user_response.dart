import 'package:doodle_drops/src/modules/auth/data/models/responses/register_user/register_user_response_data.dart';
import 'package:doodle_drops/src/modules/auth/domain/entities/responses/register_user/register_user_response.dart';

class RegisterUserResponse extends RegisterUserResponseEntity {
  const RegisterUserResponse(
      {String? message, String? error, RegisterUserResponseData? data})
      : super(message: message, error: error, data: data);

  // final RegisterUserResponseData responseData =

  factory RegisterUserResponse.fromJson(Map<String, dynamic> map) {
    return RegisterUserResponse(
        message: map['message'] ?? '',
        error: map['error'] ?? '',
        data: RegisterUserResponseData.fromJson(map['data'] ?? {}));
  }
}
