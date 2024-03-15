part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  final String? message;
  const UserState(this.message);

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial(super.message);
}
