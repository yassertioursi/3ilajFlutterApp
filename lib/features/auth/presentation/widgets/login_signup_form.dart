import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignupForm extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String)? validator;
  final bool isForPassword;
  final bool isForPhoneNumber;
  final int maxLength;

  const LoginSignupForm(
      {super.key,
      required this.controller,
      required this.labelText,
      this.validator,
      required this.isForPassword,
      required this.isForPhoneNumber,
      required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        cursorHeight: 20,
        validator: (value) {
          return validator!(value!);
        },
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.50.sp,
        ),
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: AppColors.errorRed),
          contentPadding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppColors.mainGreen,
                width: 2,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppColors.subGrey,
                width: 3,
              )),
          label: Text(
            labelText,
            style: TextStyle(
                color: AppColors.mainBlue,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
