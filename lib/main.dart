import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/bloc/login_signup_bloc.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_application_1/features/calendar/presentation/pages/calendar_page.dart';
import 'package:flutter_application_1/features/home/presentation/pages/home_page.dart';
import 'package:flutter_application_1/features/home/presentation/pages/main_navigation_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              try {
                return di.sl<LoginSignupBloc>();
              } catch (e) {
                print('Error initializing LoginSignupBloc: $e');
                rethrow;
              }
            },
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoutes.mainNavigation,
          routes: {
            AppRoutes.login: (context) => const LoginPage(),
            AppRoutes.signup: (context) => const SignupPage(),
            AppRoutes.home: (context) => const HomePage(),
            AppRoutes.calendar: (context) => const CalendarPage(),
            AppRoutes.mainNavigation: (context) => const MainNavigationPage(),
          },
          debugShowCheckedModeBanner: false,
          home: const SafeArea(child: MainNavigationPage()),
        ),
      ),
    );
  }
}
