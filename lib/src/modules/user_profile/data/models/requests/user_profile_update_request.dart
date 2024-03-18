import 'package:doodle_drops/src/modules/user_profile/domain/enitities/requests/user_profile_update_request_entity.dart';
import 'package:intl/intl.dart';

class UserProfileUpdateRequest extends UserProfileUpdateRequestEntity {
  const UserProfileUpdateRequest({
    String? displayName,
    String? firstName,
    String? middleName,
    String? lastName,
    int? age,
    DateTime? birthday,
  }) : super(
            displayName: displayName,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            age: age,
            birthday: birthday);
  //TODO FIX DATE TIME
  //To Json Mapper
  Map<String, dynamic> toJson() {
    return {
      'DisplayName': displayName,
      'FirstName': firstName,
      'MiddleName': middleName,
      'LastName': lastName,
      'Age': age,
      'Birthday': null
      // birthday != null
      //     ? DateFormat('yyyy-MM-ddTHH:mm:ss').format(birthday!)
      //     : null,
    };
  }
}
