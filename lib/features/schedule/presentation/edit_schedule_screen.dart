import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/config/app_routes.dart';
import 'package:food_ox/features/layout/recommended/manageres/recommended_cubit.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';
import 'package:food_ox/features/schedule/presentation/componant/check_box_componant.dart';
import 'package:food_ox/features/schedule/presentation/componant/data_componant.dart';
import 'package:food_ox/features/schedule/presentation/componant/week_of_days_componant.dart';
import 'package:food_ox/features/schedule/presentation/edit_schedule_componant/edit_check_box_componant.dart';
import 'package:food_ox/features/schedule/presentation/edit_schedule_componant/edit_week_of_days_componant.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class EditScheduleScreen extends StatefulWidget {
  EditScheduleScreen({Key? key}) : super(key: key);

  @override
  State<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  GlobalKey<FormState> scheduleKey = GlobalKey<FormState>();

  // List<int> weekList = [];

  String? chooseBreakFast;

  @override
  void initState() {
    if (context.read<ScheduleCubit>().getScheduleModel != null) {
      chooseBreakFast =
          context.read<ScheduleCubit>().getScheduleModel!.schedule!.period;
    }
    super.initState();
  }

  String? workFrom;
  String? workTo;

  String? breakFrom;

  String? breakTo;

  @override
  Widget build(BuildContext context) {
    String initTimeOfDay = TimeOfDay.now().format(context);

    return BlocConsumer<ScheduleCubit, ScheduleState>(
      listener: (context, state) {
        var cubit = ScheduleCubit.get(context);
        if (state is EditScheduleSuccess) {
          cubit.getSchedule();
          context.read<RecommendedCubit>().geyRecommendation();
          Navigator.pop(context);
        }
        // if (state is ScheduleSuccessState) {
        //   Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //       transitionDuration: const Duration(milliseconds: 200),
        //       pageBuilder: (context, animation, secondaryAnimation) =>
        //       const HomeScreen(),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        //           child: child,
        //         );
        //       },
        //     ),
        //   );
        // } else if (state is ScheduleErrorState) {
        //   SnackBar snackBar = SnackBarComponent.snackBar(
        //     content: 'Make schedule has a problem',
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // }
      },
      builder: (context, state) {
        var cubit = ScheduleCubit.get(context);
        var getScheduleModel = cubit.getScheduleModel;
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            title: Text(
              'Edit Schedule',
              style: GoogleFonts.darkerGrotesque(
                color: AppColors.blackColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                height: 1.h,
              ),
            ),
          ),
          body: getScheduleModel == null
              ? const Center(child: CircularProgressIndicator())
              : getScheduleModel.schedule == null
                  ? AppButton.normalButton(
                      title: 'Please Go to Schedule',
                      fontSize: 15.5.sp,
                      onPress: () {
                        Navigator.pushNamed(context, RoutePath.breakFastScreen);
                      },
                    )
                  : NotificationListener<OverscrollIndicatorNotification>(
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
                              // Period
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
                                  EditCheckBoxComponent(
                                    chosseBreakFast: chooseBreakFast == 'month'
                                        ? true
                                        : false,
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
                              // Work Time
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
                                          initialTime: convertStringToTimeOfDay(
                                              timeString: getScheduleModel
                                                      .schedule!.workFrom ??
                                                  initTimeOfDay),
                                          onChanged: (selectedTime) {
                                            workFrom =
                                                selectedTime.format(context);
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
                                          initialTime: convertStringToTimeOfDay(
                                              timeString: getScheduleModel
                                                      .schedule!.workTo ??
                                                  initTimeOfDay),
                                          onChanged: (selectedTime) {
                                            workTo =
                                                selectedTime.format(context);
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
                                          initialTime: convertStringToTimeOfDay(
                                              timeString: getScheduleModel
                                                      .schedule!.breakFrom ??
                                                  initTimeOfDay),
                                          onChanged: (selectedTime) {
                                            breakFrom =
                                                selectedTime.format(context);
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
                                          initialTime: convertStringToTimeOfDay(
                                              timeString: getScheduleModel
                                                      .schedule!.breakTo ??
                                                  initTimeOfDay),
                                          onChanged: (selectedTime) {
                                            breakTo =
                                                selectedTime.format(context);
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
                                  EditWeekdaySelectionWidget(
                                      chossenList:
                                          getScheduleModel.schedule!.days ??
                                              []),
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
                cubit.editSchedule(
                  workFrom: workFrom ??
                      getScheduleModel!.schedule!.workFrom ??
                      initTimeOfDay,
                  workTo: workTo ??
                      getScheduleModel!.schedule!.workTo ??
                      initTimeOfDay,
                  breakFrom: breakFrom ??
                      getScheduleModel!.schedule!.breakFrom ??
                      initTimeOfDay,
                  breakTo: breakTo ??
                      getScheduleModel!.schedule!.breakTo ??
                      initTimeOfDay,
                  period: chooseBreakFast ?? '',
                  days: getScheduleModel!.schedule!.days ?? [],
                );
                // print(chooseBreakFast);
                // print(lunchFrom);
                // print(lunchTO);
                // print(drinkFrom);
                // print(drinkTo);
                //   cubit.makeSchedule(
                //       period: chooseBreakFast,
                //       work_from: lunchFrom,
                //       work_to: lunchTO,
                //       break_from: drinkFrom,
                //       break_to: drinkTo,
                //       weekList: weekList);
                //   // Navigator.push(context, MaterialPageRoute(builder: (c)=>  HomeScreen()));
              },
            ),
          ),
        );
      },
    );
  }

  TimeOfDay convertStringToTimeOfDay({required String timeString}) => TimeOfDay(
        hour: int.parse(timeString.split(":")[0]),
        minute: int.parse(timeString.split(":")[1].split(" ")[0]),
      );
}
