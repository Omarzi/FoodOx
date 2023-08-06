import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/components/snack_bar.dart';
import 'package:food_ox/features/home/presentation/home_screen.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';
import 'package:food_ox/features/schedule/presentation/componant/check_box_componant.dart';
import 'package:food_ox/features/schedule/presentation/componant/data_componant.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatelessWidget {
  GlobalKey<FormState> scheduleKey = GlobalKey<FormState>();
  String chooseBreakFast = "week";

  ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String lunchFrom = TimeOfDay.now().format(context).substring(0, 5);
    String lunchTO = TimeOfDay.now().format(context).substring(0, 5);
    String drinkFrom = TimeOfDay.now().format(context).substring(0, 5);
    String drinkTo = TimeOfDay.now().format(context).substring(0, 5);

    return BlocConsumer<ScheduleCubit, ScheduleState>(
      listener: (context, state) {
        if (state is ScheduleSuccessState) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  HomeScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                  child: child,
                );
              },
            ),
          );
        } else if (state is ScheduleErrorState) {
          SnackBar snackBar = SnackBarComponent.snackBar(
              content: 'Make schedule has a problem');
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = ScheduleCubit().get(context);
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            title: Text(
              'Schedule',
              style: GoogleFonts.darkerGrotesque(
                color: AppColors.blackColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                height: 1.h,
              ),
            ),
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return false;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 25.h,
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BreakFast : ',
                          style: GoogleFonts.darkerGrotesque(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              height: 1.h),
                        ),
                        ThemeSelectionComponent(
                          onThemeChanged: (isWeek) {
                            if (!isWeek) {
                              chooseBreakFast = 'week';
                            } else {
                              chooseBreakFast = 'month';
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(color: Colors.grey[500], thickness: 1),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lunch : ',
                          style: GoogleFonts.darkerGrotesque(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              height: 1.h),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              "From : ",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  print(
                                      "the date is :${selectedTime.format(context).substring(0, 4)}:");
                                },
                              ),
                            ),
                            Text(
                              "  To : ",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  print(
                                      "the date is :${selectedTime.format(context).substring(0, 4)}:");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Divider(color: Colors.grey[500], thickness: 1),
                    SizedBox(height: 25.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Drinks : ',
                          style: GoogleFonts.darkerGrotesque(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              height: 1.h),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              "From : ",
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  print(
                                      "the date is :${selectedTime.format(context).substring(0, 4)}:");
                                },
                              ),
                            ),
                            Text(
                              "  To : ",
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  print(
                                      "the date is :${selectedTime.format(context).substring(0, 4)}:");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppButton.normalButton(
              title: 'Next',
              fontSize: 15.5.sp,
              onPress: () {
                cubit.makeSchedule(
                  period: chooseBreakFast,
                  work_from: lunchFrom,
                  work_to: lunchTO,
                  break_from: drinkFrom,
                  break_to: drinkTo,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
