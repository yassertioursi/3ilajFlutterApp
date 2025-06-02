import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.mainYellow,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "November 2020" ,
                style: TextStyle( 
                  color: AppColors.mainBlack,
                  fontSize: 16.sp,  
                  fontWeight: FontWeight.w700,
                ), 
              ),
                                 ],
             ),
          SizedBox(height: 20.h),
            
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "taskTitle" ,
                style: TextStyle(
                  color: AppColors.mainBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,  
                ),
              ),
              Text(
                "projectTitle", 
                style: TextStyle(
                  color: AppColors.mainWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,    
                
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),
         _buildProgressItemWidget()  , 

        ],
      ),
      
    );
  }


  Widget _buildProgressItemWidget(){
    return  Column(
      children: 
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Progress",
              style: TextStyle(
                color: AppColors.mainWhite,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "75%",
              style: TextStyle(
                color: AppColors.mainWhite,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
 ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.75,
              minHeight: 6,
              backgroundColor: AppColors.mainWhite , 
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
         ),


      ],
      
      ) ; 


  }
}
