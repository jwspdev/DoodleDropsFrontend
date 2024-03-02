import 'package:doodle_drops/src/modules/auth/domain/entities/responses/register_user/register_user_response_data_entity.dart';

class RegisterUserResponseData extends RegisterUserResponseDataEntity {
  const RegisterUserResponseData({required String email, String? displayName})
      : super(email: email, displayName: displayName);

  factory RegisterUserResponseData.fromJson(Map<String, dynamic> map) {
    return RegisterUserResponseData(
        email: map['Email'] ?? '', displayName: map['DisplayName']);
  }
}
