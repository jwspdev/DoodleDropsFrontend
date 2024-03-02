import 'package:equatable/equatable.dart';

class UserProfileResponseEntity extends Equatable {
  final DateTime? updatedAt;
  final String? displayName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final int? age;
  final DateTime? birthday;

  const UserProfileResponseEntity(
      {this.updatedAt,
      this.displayName,
      this.firstName,
      this.middleName,
      this.lastName,
      this.age,
      this.birthday});

  @override
  List<Object?> get props =>
      [updatedAt, displayName, firstName, middleName, lastName, age, birthday];
}
