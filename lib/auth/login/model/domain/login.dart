class Login {
  String? username;
  String? password;
  String? code;

  Login({this.code, this.username, this.password});

  Map<String, dynamic> toJsonLogin() =>
      {'username': username, 'password': password, 'totp_code': code};

  Map<String, dynamic> toJsonRecovery() =>
      {'username': username, 'password': password, 'code': code};
}
