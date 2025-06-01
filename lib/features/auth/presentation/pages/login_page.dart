import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/features/auth/domain/entities/user.dart';
import 'package:flutter_application_1/features/auth/domain/validators.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/bloc/login_signup_bloc.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/curved_login_signup_header.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/login_signup_button.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/login_signup_form.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/login_signup_sub_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlack,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CurvedHeader(
            title: 'Welcome\nBack !',
            subtitle: 'Please Enter Your Credentials',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLoginForm(),
                SizedBox(height: 30.h),
                LoginSignupButton(
                  buttonText: "Login",
                  onPressed: () {
                    _formKey.currentState!.validate();
                    context.read<LoginSignupBloc>().add(const LoginEvent(
                          user: UserAuth("", "", "", "", "", "", id: 1),
                        ));
                  },
                ),
                const LoginSignupSubTexts(
                  question: "Do not have an account? ",
                  route: "Sign up",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildLoginHeader() => Padding(
  //       padding: const EdgeInsets.only(
  //         top: 15.0,
  //       ),
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Image.asset(
  //               'lib/core/images/logo.png',
  //               height: 130.h,
  //               width: 130.w,
  //             ),
  //             Text("Welcome Back",
  //                 style: TextStyle(
  //                     color: AppColors.mainBlue,
  //                     fontSize: 27.sp,
  //                     fontWeight: FontWeight.bold)),
  //             Text("Enter your email and password",
  //                 style: TextStyle(
  //                     color: AppColors.subGrey,
  //                     fontSize: 17.sp,
  //                     fontWeight: FontWeight.w400)),
  //           ],
  //         ),
  //       ),
  //     );

  Widget _buildLoginForm() => Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LoginSignupForm(
                controller: _emailController,
                isForPassword: false,
                isForPhoneNumber: false,
                maxLength: 100,
                validator: Validators.validateEmail,
                hintText: "email",
              ),
              LoginSignupForm(
                controller: _passwordController,
                isForPassword: true,
                isForPhoneNumber: false,
                maxLength: 20,
                validator: Validators.validatePassword,
                hintText: "password",
              ),
            ],
          ),
        ),
      );
}
