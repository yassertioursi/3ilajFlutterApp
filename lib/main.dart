import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_routes.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        initialRoute: AppRoutes.login,
        routes: {
          AppRoutes.login: (context) => const LoginPage(),
          AppRoutes.signup: (context) => const SignupPage(),
        },
        debugShowCheckedModeBanner: false,
        home: const SafeArea(child: SignupPage()),
      ),
    );
  }
}
