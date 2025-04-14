abstract class OtpEvent {}

class Opt1Changed extends OtpEvent {
  final String? otp1;

  Opt1Changed({this.otp1});
}

class Opt2Changed extends OtpEvent {
  final String? otp2;

  Opt2Changed({this.otp2});
}

class Opt3Changed extends OtpEvent {
  final String? otp3;

  Opt3Changed({this.otp3});
}

class Opt4Changed extends OtpEvent {
  final String? otp4;

  Opt4Changed({this.otp4});
}

class Opt5Changed extends OtpEvent {
  final String? otp5;

  Opt5Changed({this.otp5});
}

class Opt6Changed extends OtpEvent {
  final String? otp6;

  Opt6Changed({this.otp6});
}

class OtpSubmitted extends OtpEvent {}
