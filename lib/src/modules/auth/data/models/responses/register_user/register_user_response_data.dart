import 'package:doodle_drops/src/modules/auth/domain/entities/responses/register_user/register_user_response_data.dart';

class RegisterUserResponseData extends RegisterUserResponseDataEntity {
  const RegisterUserResponseData({required String email}) : super(email: email);

  factory RegisterUserResponseData.fromJson(Map<String, dynamic> map) {
    return RegisterUserResponseData(email: map['Email'] ?? '');
  }
}
