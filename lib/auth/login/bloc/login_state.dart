import 'package:flutter_dev_test/common/form_submission_status.dart';

class LoginState {
  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  bool get isValidUserName => username.isNotEmpty;
  bool get isValidPassword => password.isNotEmpty;

  LoginState(
      {this.username = '',
      this.password = '',
      this.formStatus = const IniticalStatus()});

  LoginState copyWith(
      {String? username, String? password, FormSubmissionStatus? formStatus}) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
