import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/features/auth/domain/validators.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/login_signup_button.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/login_signup_form.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/login_signup_sub_texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSignupHeader(),
          _buildSignupForm(),
          Column(
            children: [
              LoginSignupButton(
                buttonText: "Register",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              const LoginSignupSubTexts(
                question: "Already have an account? ",
                route: 'Sign in',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignupHeader() => Center(
        child: Row(
          children: [
            Image.asset(
              'lib/core/images/logo.png',
              height: 90.h,
              width: 90.w,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign up",
                      style: TextStyle(
                          color: AppColors.mainBlue,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold)),
                  Text("Create your account",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: AppColors.subGrey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildSignupForm() => Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: LoginSignupForm(
                    controller: _firstNameController,
                    labelText: 'First Name',
                    isForPassword: false,
                    isForPhoneNumber: false,
                    maxLength: 20,
                    validator: Validators.validateName,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: LoginSignupForm(
                    controller: _lastNameController,
                    labelText: 'Last Name',
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
              labelText: 'Email Adress',
              isForPassword: false,
              isForPhoneNumber: false,
              maxLength: 100,
              validator: Validators.validateEmail,
            ),
            LoginSignupForm(
              controller: _phoneNumberController,
              labelText: 'Phone Number',
              isForPassword: false,
              isForPhoneNumber: true,
              maxLength: 10,
              validator: Validators.validatePhoneNumber,
            ),
            LoginSignupForm(
              controller: _passwordController,
              labelText: 'Password',
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
              labelText: 'Confirm Password',
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
