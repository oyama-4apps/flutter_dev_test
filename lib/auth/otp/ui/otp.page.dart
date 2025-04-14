import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/auth/otp/bloc/otp_bloc.dart';
import 'package:flutter_dev_test/auth/otp/bloc/otp_event.dart';
import 'package:flutter_dev_test/auth/otp/bloc/otp_state.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/common/form_submission_status.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            OtpBloc(authRepository: context.read<AuthRepository>()),
        child: _otpForm(),
      ),
    );
  }

  Widget _otpForm() {
    const spacer = SizedBox(
      width: 8,
    );
    return BlocListener<OtpBloc, OtpState>(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _otpField(fieldId: 1),
                  ),
                  spacer,
                  Expanded(
                    child: _otpField(fieldId: 2),
                  ),
                  spacer,
                  Expanded(
                    child: _otpField(fieldId: 3),
                  ),
                  spacer,
                  Expanded(
                    child: _otpField(fieldId: 4),
                  ),
                  spacer,
                  Expanded(
                    child: _otpField(fieldId: 5),
                  ),
                  spacer,
                  Expanded(
                    child: _otpField(fieldId: 6),
                  ),
                ],
              ),
              _confirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpField({required int fieldId}) {
    return BlocBuilder<OtpBloc, OtpState>(
      builder: (context, state) {
        return TextFormField(
          maxLength: 1,
          textAlign: TextAlign.center,
          //   decoration: const InputDecoration(hintText: 'UserName'),
          validator: (value) => null,
          //  state.isValidUserName ? null : 'Informe o usuário',
          onChanged: (value) =>
              context.read<OtpBloc>().add(_getOtpEvent(fieldId, value)),
        );
      },
    );
  }

  Widget _confirmButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Confirmar'),
    );
  }

  void _showSnackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  OtpEvent _getOtpEvent(num fieldId, String value) {
    switch (fieldId) {
      case 1:
        return Opt1Changed(otp1: value);
      case 2:
        return Opt2Changed(otp2: value);
      case 3:
        return Opt3Changed(otp3: value);
      case 4:
        return Opt4Changed(otp4: value);
      case 5:
        return Opt5Changed(otp5: value);
      default:
        return Opt6Changed(otp6: value);
    }
  }
}
