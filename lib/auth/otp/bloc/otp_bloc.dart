import 'package:bloc/bloc.dart';
import 'package:flutter_dev_test/auth/login/model/domain/login.dart';
import 'package:flutter_dev_test/auth/otp/bloc/otp_event.dart';
import 'package:flutter_dev_test/auth/otp/bloc/otp_state.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/common/form_submission_status.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository authRepository;

  OtpBloc({required this.authRepository}) : super(const OtpState.empty()) {
    on<Opt1Changed>((event, emit) => emit(state.copyWith(otp1: event.otp1)));
    on<Opt2Changed>((event, emit) => emit(state.copyWith(otp2: event.otp2)));
    on<Opt3Changed>((event, emit) => emit(state.copyWith(otp3: event.otp3)));
    on<Opt4Changed>((event, emit) => emit(state.copyWith(otp4: event.otp4)));
    on<Opt5Changed>((event, emit) => emit(state.copyWith(otp5: event.otp5)));
    on<Opt6Changed>((event, emit) => emit(state.copyWith(otp6: event.otp6)));
    on<OtpSubmitted>(
        (event, emit) => emit(state.copyWith(formStatus: const Submitting())));
  }

  Future<void> requestOtp({required Login login}) async {
    authRepository.login(login: login);
  }
}
