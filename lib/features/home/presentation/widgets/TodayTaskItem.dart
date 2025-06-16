import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayTaskItem extends StatelessWidget {
  final String title;
  final String project;
  final VoidCallback? onTap;
  final VoidCallback? onOptionsTap;

  const TodayTaskItem({
    super.key,
    required this.title,
    required this.project,
    this.onTap,
    this.onOptionsTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          _buildMainContainer(),
          _buildIconContainer(),
        ],
      ),
    );
  }

  Widget _buildMainContainer() {
    return Container(
      height: 60.h,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.mainWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 56.w),
          SizedBox(width: 12.w),
          Expanded(child: _buildTaskContent()),
          _buildOptionsButton(),
        ],
      ),
    );
  }

  Widget _buildTaskContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: AppColors.mainBlack,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          project,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.mainYellow,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsButton() {
    return IconButton(
      icon: const Icon(Icons.more_horiz, color: Colors.black),
      onPressed: onOptionsTap,
    );
  }

  Widget _buildIconContainer() {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: AppColors.mainYellow,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Icon(
          Icons.assignment_outlined,
          color: AppColors.mainWhite,
          size: 24.sp,
        ),
      ),
    );
  }
}