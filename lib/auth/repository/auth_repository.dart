import 'package:flutter_dev_test/auth/login/model/domain/login.dart';
import 'package:flutter_dev_test/auth/login/model/remote/recovery_secret.mapper.dart';
import 'package:flutter_dev_test/auth/login/service/auth.service.dart';

class AuthRepository {
  final _service = AuthService();

  Future<bool> login({required Login login}) async {
    return await _service.login(login: login);
  }

  Future<RecoverySecretMapper> requestOtp({required Login login}) async {
    return await _service.requestOtpCode(login: login);
  }
}
