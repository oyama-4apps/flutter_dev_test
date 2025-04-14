import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/auth/login/ui/login.page.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/values/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Flutter Test',
      theme: AppTheme.theme,
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginPage(), //OtpPage(),
      ),
    );
  }
}
