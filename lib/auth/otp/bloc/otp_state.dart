import '../../../common/form_submission_status.dart';

class OtpState {
  final String? otp1;
  final String? otp2;
  final String? otp3;
  final String? otp4;
  final String? otp5;
  final String? otp6;
  final FormSubmissionStatus? formStatus;

  OtpState(
      {this.otp1 = '',
      this.otp2 = '',
      this.otp3 = '',
      this.otp4 = '',
      this.otp5 = '',
      this.otp6 = '',
      this.formStatus = const IniticalStatus()});

  OtpState copyWith(
      {String? otp1,
      String? otp2,
      String? otp3,
      String? otp4,
      String? otp5,
      String? otp6,
      FormSubmissionStatus? formStatus}) {
    return OtpState(
      otp1: otp1 ?? this.otp1,
      otp2: otp2 ?? this.otp2,
      otp3: otp3 ?? this.otp3,
      otp4: otp4 ?? this.otp4,
      otp5: otp5 ?? this.otp5,
      otp6: otp6 ?? this.otp6,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
