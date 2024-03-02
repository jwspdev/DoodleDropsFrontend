import 'package:doodle_drops/src/modules/auth/domain/entities/responses/get_user_details/user_profile_response_entity.dart';

class UserProfileResponse extends UserProfileResponseEntity {
  const UserProfileResponse({
    DateTime? updatedAt,
    String? displayName,
    String? firstName,
    String? middleName,
    String? lastName,
    int? age,
    DateTime? birthday,
  }) : super(
            updatedAt: updatedAt,
            displayName: displayName,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            age: age,
            birthday: birthday);
  //Json Mapper
  factory UserProfileResponse.fromJson(Map<String, dynamic> map) {
    return UserProfileResponse(
        updatedAt:
            DateTime.parse(map['updated_at'] ?? DateTime.now().toString()),
        displayName: map['display_name'] ?? '',
        firstName: map['first_name'] ?? '',
        middleName: map['middle_name'] ?? '',
        lastName: map['last_name'] ?? '',
        age: map['age'] ?? 0,
        birthday: DateTime.parse(map['birthday'] ?? DateTime.now().toString()));
  }

  //to Json mapper
  Map<String, dynamic> toJson() {
    return {
      'updated_at': updatedAt,
      'display_name': displayName,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'age': age,
      'birthday': birthday
    };
  }
}
