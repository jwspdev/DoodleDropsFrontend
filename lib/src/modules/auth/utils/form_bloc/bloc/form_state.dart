part of 'form_bloc.dart';

sealed class FormState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FormInitial extends FormState {
  @override
  List<Object?> get props => [];
}

final class FormsValidatedState extends FormState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final String? errorMessage;

  FormsValidatedState({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.isPasswordValid,
    this.errorMessage,
  });

  FormsValidatedState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isLoading,
    String? errorMessage,
    bool? isFormSuccessful,
  }) {
    return FormsValidatedState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isEmailValid,
        isPasswordValid,
        errorMessage,
      ];
}
