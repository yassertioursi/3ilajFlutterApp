import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/constants/app_time.dart';
import 'package:flutter_application_1/features/calendar/presentation/bloc/cubit/calendar_cubit.dart';
import 'package:flutter_application_1/features/calendar/presentation/bloc/cubit/calendar_state.dart';
import 'package:flutter_application_1/features/calendar/presentation/widgets/search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit(),
      child: Scaffold(
        backgroundColor: AppColors.bgBlack,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSearchWithFilters(),
        _buildCalendar(),
      ],
    );
  }

  Widget _buildSearchWithFilters() {
    return Row(
      children: [
        _buildSearchBar(),
        _buildFilterButton(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return SearchField(controller: TextEditingController());
  }

  Widget _buildFilterButton() {
    return IconButton(
      icon: Icon(Icons.filter_list, color: AppColors.mainWhite),
      onPressed: () {
        // Implement filter functionality here
      },
    );
  }

  BlocBuilder<CalendarCubit, CalendarState> _buildCalendar() {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainBlack,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: TableCalendar(
              firstDay: DateTime(DateTime.now().year, 1, 1),
              lastDay: DateTime(AppTime.currentYear, 12, 31),
              focusedDay: state.focusedDay,
              selectedDayPredicate: (day) => isSameDay(state.selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                context
                    .read<CalendarCubit>()
                    .selectDay(selectedDay, focusedDay);
              },
              onPageChanged: (focusedDay) {
                context.read<CalendarCubit>().changeFocusedDay(focusedDay);
              },
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainWhite,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: AppColors.mainYellow,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: AppColors.mainYellow,
                ),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                  color: AppColors.mainYellow.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.mainYellow,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(
                  color: AppColors.mainWhite,
                  fontSize: 14.sp,
                ),
                weekendTextStyle: TextStyle(
                  color: AppColors.mainWhite,
                  fontSize: 14.sp,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: AppColors.mainWhite,
                  fontWeight: FontWeight.w600,
                ),
                weekendStyle: TextStyle(
                  color: AppColors.mainWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
