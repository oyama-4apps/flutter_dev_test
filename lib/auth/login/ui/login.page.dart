import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/auth/login/bloc/login_bloc.dart';
import 'package:flutter_dev_test/auth/login/bloc/login_event.dart';
import 'package:flutter_dev_test/auth/login/bloc/login_state.dart';
import 'package:flutter_dev_test/auth/login/model/domain/login.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/common/form_submission_status.dart';
import 'package:flutter_dev_test/values/assets_constants.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepository: context.read<AuthRepository>()),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is Failed) {
          _showSnackBar(
              context: context, message: formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getImage(),
              _userNameField(),
              const SizedBox(
                height: 10,
              ),
              _passwordField(),
              const SizedBox(
                height: 20,
              ),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userNameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
          validator: (value) =>
              state.isValidUserName ? null : 'Informe o usuário',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Senha'),
          validator: (value) =>
              state.isValidPassword ? null : 'Informe a senha',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is Submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (context.read<LoginBloc>().state.code.isEmpty) {
                      context.pushNamed('otppage');
                    } else {
                      context.read<LoginBloc>().login(
                          login: Login(
                              username: state.username,
                              password: state.password));
                    }
                  }
                },
                child: const Text('Login'),
              );
      },
    );
  }

  Widget _getImage() {
    return Image.asset(
      AssetConstants.logo,
    );
  }

  void _showSnackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
