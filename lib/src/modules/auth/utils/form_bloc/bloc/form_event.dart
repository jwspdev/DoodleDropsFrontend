// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_bloc.dart';

sealed class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedFormEvent extends FormEvent {
  final String email;
  const EmailChangedFormEvent(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChangedFormEvent extends FormEvent {
  final String password;
  const PasswordChangedFormEvent(this.password);

  @override
  List<Object> get props => [password];
}

class EmailHasDuplicateEvent extends FormEvent {
  final String email;

  const EmailHasDuplicateEvent(this.email);
  @override
  List<Object> get props => [email];
}
