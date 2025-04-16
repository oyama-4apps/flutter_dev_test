import 'dart:convert';
import 'dart:io';

import 'package:flutter_dev_test/auth/login/model/domain/login.dart';
import 'package:flutter_dev_test/auth/login/model/remote/recovery_secret.mapper.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final http.Client httpClient = http.Client();

  final String baseUrl = 'http://10.0.2.2:5000';
  final Map<String, String>? baseHeaders = {
    'Content-Type': 'application/json',
    'accept': '*'
  };

  Future<RecoverySecretMapper> requestOtpCode({required Login login}) async {
    final http.Response response = await httpClient.post(
        Uri.parse('$baseUrl/auth/recovery-secret'),
        headers: baseHeaders,
        body: jsonEncode(login.toJsonRecovery()));

    if (response.statusCode == 200) {
      return RecoverySecretMapper.fromJson(jsonDecode(response.body));
    } else {
      throw RecoverySecretMapper.fromJson(jsonDecode(response.body));
    }
  }

  Future<bool> login({required Login login}) async {
    final http.Response response = await httpClient.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: baseHeaders,
        body: jsonEncode(login.toJsonRecovery()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
