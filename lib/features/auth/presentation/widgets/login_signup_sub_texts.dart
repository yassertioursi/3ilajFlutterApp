import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignupSubTexts extends StatelessWidget {
  final String question;
  final String route;
  const LoginSignupSubTexts(
      {super.key, required this.question, required this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(color: AppColors.subGrey, fontSize: 18.sp),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            route,
            style: TextStyle(
                color: AppColors.mainBlue,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
