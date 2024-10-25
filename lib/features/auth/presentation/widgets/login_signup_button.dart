import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/bloc/login_signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignupButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const LoginSignupButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.mainGreen,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: BlocConsumer<LoginSignupBloc, LoginSignupState>(
              builder: (context, state) {
            return Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            );
          }, listener: (context, state) {
            if (state is MessageLoginSignupState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is ErrorSignUpLoginState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }),
        ),
      ),
    );
  }
}
