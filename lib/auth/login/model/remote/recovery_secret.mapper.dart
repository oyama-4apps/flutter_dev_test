class RecoverySecretMapper {
  final String? message;
  final String? totpSecret;

  RecoverySecretMapper({this.message, this.totpSecret});

  factory RecoverySecretMapper.fromJson(Map<String, dynamic> json) =>
      RecoverySecretMapper(
        message: json['message'],
        totpSecret: json['totp_secret'],
      );
}
