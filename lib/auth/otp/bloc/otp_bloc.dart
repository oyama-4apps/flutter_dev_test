import 'package:bloc/bloc.dart';
import 'package:flutter_dev_test/auth/otp/bloc/otp_event.dart';
import 'package:flutter_dev_test/auth/otp/bloc/otp_state.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/common/form_submission_status.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository authRepository;

  OtpBloc({required this.authRepository}) : super(OtpState());

  Stream<OtpState> mapeEventToState(OtpEvent event) async* {
    if (event is Opt1Changed) {
      yield state.copyWith(otp1: event.otp1);
    } else if (event is Opt2Changed) {
      yield state.copyWith(otp2: event.otp2);
    } else if (event is Opt3Changed) {
      yield state.copyWith(otp3: event.otp3);
    } else if (event is Opt4Changed) {
      yield state.copyWith(otp4: event.otp4);
    } else if (event is Opt5Changed) {
      yield state.copyWith(otp5: event.otp5);
    } else if (event is Opt6Changed) {
      yield state.copyWith(otp6: event.otp6);
    }
    try {
      await authRepository.validateOtp();
      yield state.copyWith(formStatus: const Success());
    } on Exception catch (ex) {
      yield state.copyWith(formStatus: Failed(exception: ex));
    }
  }
}
