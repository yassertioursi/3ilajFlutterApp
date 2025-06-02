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
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
  
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
        user: UserAuth.forSignup(
          fullName: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          passwordconfirmation: _confirmPasswordController.text,
        ),
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



  Widget _buildSignupForm() => Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: LoginSignupForm(
                    controller: _nameController,
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
