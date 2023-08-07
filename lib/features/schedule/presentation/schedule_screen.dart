import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/components/snack_bar.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/layout/home/presentation/home_screen.dart';
import 'package:food_ox/features/layout/layout.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';
import 'package:food_ox/features/schedule/presentation/componant/check_box_componant.dart';
import 'package:food_ox/features/schedule/presentation/componant/data_componant.dart';
import 'package:food_ox/features/schedule/presentation/componant/week_of_days_componant.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatelessWidget {
  GlobalKey<FormState> scheduleKey = GlobalKey<FormState>();
  String chooseBreakFast = "week";

  ScheduleScreen({Key? key}) : super(key: key);
  List<int> weekList = [];

  @override
  Widget build(BuildContext context) {
    String lunchFrom = TimeOfDay.now().format(context);
    String lunchTO = TimeOfDay.now().format(context);
    String drinkFrom = TimeOfDay.now().format(context);
    String drinkTo = TimeOfDay.now().format(context);

    return BlocConsumer<ScheduleCubit, ScheduleState>(
      listener: (context, state) {
var cubit = ScheduleCubit.get(context);
        if (state is ScheduleSuccessState) {
          context.read<CategoriesCubit>().getMenu();
          cubit.getSchedule();
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const LayoutScreen(),
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
            content: 'Make schedule has a problem',
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = ScheduleCubit.get(context);
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
                          'Period : ',
                          style: GoogleFonts.darkerGrotesque(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            height: 1.h,
                          ),
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
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Work Time : ',
                          style: GoogleFonts.darkerGrotesque(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              height: 1.h),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              "From : ",
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 18.sp,
                                height: 1.h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  lunchFrom = selectedTime.format(context);
                                  print(
                                      "the date is :${selectedTime.format(context)},");
                                },
                              ),
                            ),
                            Text(
                              "  To : ",
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 18.sp,
                                height: 1.h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  lunchTO = selectedTime.format(context);
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
                          'Break Time : ',
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
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 18.sp,
                                height: 1.h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  drinkFrom = selectedTime.format(context);
                                  print(
                                      "the date is :${selectedTime.format(context).substring(0, 4)}:");
                                },
                              ),
                            ),
                            Text(
                              "  To : ",
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 18.sp,
                                height: 1.h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: TimeSelectionComponent(
                                initialTime: TimeOfDay.now(),
                                onChanged: (selectedTime) {
                                  drinkTo = selectedTime.format(context);
                                  print(
                                      "the date is :${selectedTime.format(context).substring(0, 4)}:");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(color: Colors.grey[500], thickness: 1),
                    SizedBox(height: 25.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Days : ',
                          style: GoogleFonts.darkerGrotesque(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            height: 1.h,
                          ),
                        ),
                        WeekdaySelectionWidget(chossenList: weekList),
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
            if(weekList.isEmpty){
              SnackBar snackBar =
              SnackBarComponent.snackBar(content: 'Please Choose one Day at least');
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }else{
              cubit.makeSchedule(
                  period: chooseBreakFast,
                  work_from: lunchFrom,
                  work_to: lunchTO,
                  break_from: drinkFrom,
                  break_to: drinkTo,
                  weekList: weekList);
            }

                // Navigator.push(context, MaterialPageRoute(builder: (c)=>  HomeScreen()));
              },
            ),
          ),
        );
      },
    );
  }
}
