import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/auth/login/bloc/login_event.dart';
import 'package:flutter_dev_test/auth/login/bloc/login_state.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/common/form_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState());

  Stream<LoginState> mapeEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: const Submitting());
      try {
        await authRepository.login();
        yield state.copyWith(formStatus: const Success());
      } on Exception catch (ex) {
        yield state.copyWith(formStatus: Failed(exception: ex));
      }
    }
  }
}
