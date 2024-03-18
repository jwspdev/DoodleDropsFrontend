import 'package:bloc/bloc.dart';
import 'package:doodle_drops/src/core/utils/regular_expressions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormsValidatedState> {
  FormBloc()
      : super(FormsValidatedState(
          email: "test@gmail.com",
          password: "",
          isEmailValid: true,
          isPasswordValid: false,
        )) {
    on<FormEvent>((event, emit) {});
    on<EmailChangedFormEvent>(_onEmailChanged);
    on<EmailHasDuplicateEvent>(_checkIfEmailIsDuplicated);
  }

  bool _isEmailValid(String email) {
    return EMAIL_REG_EXP.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return PASSWORD_REG_EXP.hasMatch(password);
  }

  //check if email has been changed; include checker
  _onEmailChanged(EmailChangedFormEvent event, Emitter<FormState> emit) {
    String email = event.email;
    emit(state.copyWith(
        email: email,
        isEmailValid: _isEmailValid(email),
        errorMessage: !_isEmailValid(email) ? 'Input a valid email' : ''));
  }

  //TODO check API if there are duplicates
  _checkIfEmailIsDuplicated(
      EmailHasDuplicateEvent event, Emitter<FormState> emit) {
    String email = event.email;
    List<String> emails = ['test@gmail.com', 'test123@gmail.com'];
    bool isDuplicate = emails.contains(email);
    debugPrint('DUPLICATE TRIGGERED');
    return emit(state.copyWith(
        email: email,
        isEmailValid: false,
        errorMessage: isDuplicate ? 'Email already exists!' : ''));
  }
}
