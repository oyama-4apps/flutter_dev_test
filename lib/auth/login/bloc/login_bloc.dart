import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/auth/login/bloc/login_event.dart';
import 'package:flutter_dev_test/auth/login/bloc/login_state.dart';
import 'package:flutter_dev_test/auth/login/model/domain/login.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/common/form_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LoginState.empty()) {
    on<LoginUsernameChanged>(
      (event, emit) {
        emit(
          state.copyWith(username: event.username),
        );
      },
    );

    on<LoginPasswordChanged>(
      (event, emit) async {
        emit(
          state.copyWith(password: event.password),
        );
      },
    );

    on<LoginSubmitted>(
      (event, emit) async {
        emit(
          state.copyWith(formStatus: const Submitting()),
        );
      },
    );
  }

  Future<void> login({required Login login}) async {
    authRepository.login(login: login);
  }
}
