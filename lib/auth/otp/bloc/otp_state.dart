import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../common/form_submission_status.dart';

@immutable
class OtpState extends Equatable {
  final String otp1;
  final String otp2;
  final String otp3;
  final String otp4;
  final String otp5;
  final String otp6;
  final FormSubmissionStatus? formStatus;

  bool get isOtp1Valid => otp1.isNotEmpty;
  bool get isOtp2Valid => otp2.isNotEmpty;
  bool get isOtp3Valid => otp3.isNotEmpty;
  bool get isOtp4Valid => otp4.isNotEmpty;
  bool get isOtp5Valid => otp5.isNotEmpty;
  bool get isOtp6Valid => otp6.isNotEmpty;

  const OtpState.empty()
      : otp1 = '',
        otp2 = '',
        otp3 = '',
        otp4 = '',
        otp5 = '',
        otp6 = '',
        formStatus = const IniticalStatus();

  const OtpState(
      {required this.otp1,
      required this.otp2,
      required this.otp3,
      required this.otp4,
      required this.otp5,
      required this.otp6,
      required this.formStatus});

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

  @override
  List<Object?> get props => [otp1, otp2, otp3, otp4, otp5, otp6, formStatus];
}
