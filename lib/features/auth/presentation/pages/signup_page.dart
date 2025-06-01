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

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
  return SafeArea(
    child: Column(
      children: [
       
        const CurvedHeader(
          title: 'Create your\nAccount',
          subtitle: 'register is fast and free !',
          showBackButton: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                _buildSignupForm(),

                LoginSignupButton(
                  buttonText: "Register",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginSignupBloc>().add(SignupEvent(
                        user: UserAuth(
                          _lastNameController.text,
                          _emailController.text, 
                          _passwordController.text,
                          "", "", "", 
                          id: 1
                        )
                      ));
                    }
                  },
                ),
      
                const LoginSignupSubTexts(
                  question: "Already have an account? ",
                  route: 'Sign in',
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  // Widget _buildSignupHeader() => Center(
  //       child: Row(
  //         children: [
  //           Image.asset(
  //             'lib/core/images/logo.png',
  //             height: 90.h,
  //             width: 90.w,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 25.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Sign up",
  //                     style: TextStyle(
  //                         color: AppColors.mainBlue,
  //                         fontSize: 24.sp,
  //                         fontWeight: FontWeight.bold)),
  //                 Text("Create your account",
  //                     textAlign: TextAlign.right,
  //                     style: TextStyle(
  //                         color: AppColors.subGrey,
  //                         fontSize: 18.sp,
  //                         fontWeight: FontWeight.w400)),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  Widget _buildSignupForm() => Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: LoginSignupForm(
                    controller: _lastNameController,
                    hintText: "full name",
                    isForPassword: false,
                    isForPhoneNumber: false,
                    maxLength: 20,
                    validator: Validators.validateName,
                  ),
                ),
              ],
            ),
            LoginSignupForm(
              controller: _emailController,
              hintText: "email",
              isForPassword: false,
              isForPhoneNumber: false,
              maxLength: 100,
              validator: Validators.validateEmail,
            ),
            LoginSignupForm(
              controller: _passwordController,
              hintText: 'password',
              isForPassword: true,
              isForPhoneNumber: false,
              maxLength: 20,
              validator: (value) {
                _password = value;
                return Validators.validatePassword(value);
              },
            ),
            LoginSignupForm(
              controller: _confirmPasswordController,
              hintText: 'confirm password',
              isForPassword: true,
              isForPhoneNumber: false,
              maxLength: 20,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _password) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ],
        ),
      );
}
