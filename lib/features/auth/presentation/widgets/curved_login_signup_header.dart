import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurvedHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showBackButton;

  const CurvedHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showBackButton = false, 
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        height: 250.h,
        width: double.infinity,
        color: AppColors.mainYellow,
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showBackButton ? _buildBackButton(context) : const SizedBox(),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 20.h);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget _buildBackButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}