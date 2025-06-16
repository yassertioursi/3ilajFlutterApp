import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/cubit/home_tab_cubit.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/TaskItem.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/TodayTaskItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeTabCubit(),
      child: Scaffold(
        backgroundColor: AppColors.bgBlack,
        body: _buildBody(),
        bottomNavigationBar: _buildBottomAppBar() ,
        
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildProfilePicture(),
                      _buildWelcomeText(),
                    ],
                  ),
                  _buildNotification(),
                ],
              ),
              SizedBox(height: 30.h),
              _buildTabButtons(),
              SizedBox(height: 30.h),
              _buildTabContent(),

              SizedBox(height: 30.h),
              _buildTodayTasks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotification() {
    return IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.solidBell,
                    color: AppColors.mainYellow,
                    size: 28.sp,
                  ),
                );
  }

Widget _buildBottomAppBar() {
  return Container(
    height: 70.h,
    decoration: BoxDecoration(
      color: AppColors.mainBlack,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBottomNavItem(
          icon: FontAwesomeIcons.home,
          label: 'Home',
          isSelected: true, 
          onTap: () {
          
          },
        ),
        _buildBottomNavItem(
          icon: FontAwesomeIcons.plus,
          label: 'Add Task',
          isSelected: false,
          onTap: () {
            
          },
        ),
      ],
    ),
  );
}



Widget _buildBottomNavItem({
  required IconData icon,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            color: isSelected ? AppColors.mainYellow : AppColors.subGrey,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: isSelected ? AppColors.mainYellow : AppColors.subGrey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}



  Widget _buildTabButtons() {
    return BlocBuilder<HomeTabCubit, HomeTab>(
      builder: (context, selectedTab) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            _buildTabButton(
              context,
              'My Tasks',
              HomeTab.myTasks,
              selectedTab == HomeTab.myTasks,
            ),
            SizedBox(width: 15.w), 
            _buildTabButton(
              context,
              'My Projects',
              HomeTab.myProjects,
              selectedTab == HomeTab.myProjects,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTabButton(BuildContext context, String title, HomeTab tab, bool isSelected) {
    return InkWell(
      onTap: () => context.read<HomeTabCubit>().selectTab(tab),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainYellow : AppColors.subYellow,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: isSelected ? AppColors.mainWhite : AppColors.mainYellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return BlocBuilder<HomeTabCubit, HomeTab>(
      builder: (context, selectedTab) {
        switch (selectedTab) {
          case HomeTab.myTasks:
            return TaskItem(taskTitle: '', projectTitle: '', progress: 0.5, date: '',)  ; 
          case HomeTab.myProjects:
            return _buildMyProjectsContent();
        }
      },
    );
  }

  

  Widget _buildMyProjectsContent() {
    return  SizedBox(
      height: 200.h,
      child: Center(
        child: Text(
          'My Projects Content',
          style: TextStyle(
            color: AppColors.mainWhite,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildTodayTasks(){

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           
            Text("Today's Tasks" ,  
            style:  TextStyle(      
               color: AppColors.mainYellow , 
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
            ),
            ) ,
             SizedBox(height: 10.h,) , 

            TodayTaskItem(
              title: "Task 1",
              project: "Project A",
              onTap: () {
              
              },
              onOptionsTap: () {
               
              }, 
            ) , 



         ],


     )
    
      ; 
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 25.r,
      child: CircleAvatar(
        radius: 20.r,
        backgroundImage: const AssetImage('core/images/logo.png'),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello! Yasser',
            style: TextStyle(
              fontSize: 17.sp,
              color: AppColors.mainWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'You\'ve 4 tasks today!',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.subGrey,
            ),
          ),
        ],
      ),
    );
  }
}