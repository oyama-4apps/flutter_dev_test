import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/common/form_submission_status.dart';

@immutable
class LoginState extends Equatable {
  final String username;
  final String password;
  final String code;
  final FormSubmissionStatus formStatus;

  bool get isValidUserName => username.isNotEmpty;
  bool get isValidPassword => password.isNotEmpty;

  const LoginState.empty()
      : username = '',
        password = '',
        code = '',
        formStatus = const IniticalStatus();

  const LoginState(
      {required this.username,
      required this.password,
      required this.code,
      required this.formStatus});

  LoginState copyWith(
      {String? username,
      String? password,
      String? code,
      FormSubmissionStatus? formStatus}) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      code: code ?? this.code,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [username, password, code, formStatus];
}
