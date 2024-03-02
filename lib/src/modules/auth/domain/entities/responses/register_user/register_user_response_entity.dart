import 'package:doodle_drops/src/modules/auth/data/models/responses/register_user/register_user_response_data.dart';
// import 'package:doodle_drops/src/modules/auth/domain/entities/responses/register_user_response_data.dart';
import 'package:equatable/equatable.dart';

class RegisterUserResponseEntity extends Equatable {
  final String? message;
  final String? error;
  final RegisterUserResponseData? data;

  const RegisterUserResponseEntity({this.message, this.error, this.data});

  @override
  List<Object?> get props => [message, error, data];
}
