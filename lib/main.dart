import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/auth/home/ui/home.page.dart';
import 'package:flutter_dev_test/auth/login/model/domain/login.dart';
import 'package:flutter_dev_test/auth/login/ui/login.page.dart';
import 'package:flutter_dev_test/auth/otp/ui/otp.page.dart';
import 'package:flutter_dev_test/auth/repository/auth_repository.dart';
import 'package:flutter_dev_test/values/app_theme.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return RepositoryProvider(
            create: (context) => AuthRepository(), child: LoginPage());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'otppage',
          name: 'otppage',
          builder: (BuildContext context, GoRouterState state) {
            return RepositoryProvider(
              create: (context) => AuthRepository(),
              child: OtpPage(
                login: state.extra as Login,
              ),
            );
          },
        ),
        GoRoute(
          path: 'home',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return RepositoryProvider(
                create: (context) => AuthRepository(), child: const HomePage());
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dev Flutter Test',
      theme: AppTheme.theme,
      routerConfig: _router,
      /*
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginPage(), //OtpPage(),
      ),
      */
    );
  }
}
