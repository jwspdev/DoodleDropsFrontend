import 'package:equatable/equatable.dart';

class UserProfileUpdateRequestEntity extends Equatable {
  final String? displayName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final int? age;
  final DateTime? birthday;

  const UserProfileUpdateRequestEntity(
      {this.displayName,
      this.firstName,
      this.middleName,
      this.lastName,
      this.age,
      this.birthday});

  @override
  List<Object?> get props =>
      [displayName, firstName, middleName, lastName, age, birthday];
}
