part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserProfileEvent extends UserEvent {
  final String? displayName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final int? age;
  final DateTime? birthDate;

  const UpdateUserProfileEvent(
      {this.displayName,
      this.firstName,
      this.middleName,
      this.lastName,
      this.age,
      this.birthDate});
  @override
  List<Object> get props => [
        displayName!,
        firstName!,
        middleName!,
        lastName!,
        age!,
        birthDate!,
      ];
}
