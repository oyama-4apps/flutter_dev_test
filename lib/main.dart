import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/auth/otp/ui/otp.page.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Flutter Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: RepositoryProvider(
      //   create: (context) => AuthRepository(),
      //   child: LoginPage(),
      // ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: OtpPage(),
      ),
    );
  }
}
