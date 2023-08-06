import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/components/app_buttons.dart';
import 'package:food_ox/components/snack_bar.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:food_ox/features/home/presentation/home_screen.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';
import 'package:food_ox/features/schedule/presentation/componant/check_box_componant.dart';
import 'package:food_ox/features/schedule/presentation/componant/data_componant.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatelessWidget {
  GlobalKey<FormState> scheduleKey = GlobalKey<FormState>();
  String chooseBreakFast = "week";
  // TextEditingController breakTimeController = TextEditingController();
  //
  // TextEditingController lunchFromTimeController = TextEditingController();
  // TextEditingController lunchToTimeController = TextEditingController();
  //
  // TextEditingController drinkFromTimeController = TextEditingController();
  // TextEditingController drinkToTimeController = TextEditingController();

  ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String lunchFrom = "${TimeOfDay.now().format(context).substring(0, 5)}";
    String lunchTO = "${TimeOfDay.now().format(context).substring(0, 5)}";
    String drinkFrom = "${TimeOfDay.now().format(context).substring(0, 5)}";
    String drinkTo = "${TimeOfDay.now().format(context).substring(0, 5)}";

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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Text(
                    //               'Hi,',
                    //               style: GoogleFonts.darkerGrotesque(
                    //                 color: AppColors.blackColor,
                    //                 height: 1.h,
                    //                 fontWeight: FontWeight.w500,
                    //                 fontSize: 24.sp,
                    //               ),
                    //             ),
                    //             SizedBox(width: 5.w),
                    //             Text(
                    //               'Good Morning',
                    //               style: GoogleFonts.darkerGrotesque(
                    //                 color:
                    //                     AppColors.blackColor.withOpacity(0.9),
                    //                 height: 1.h,
                    //                 fontWeight: FontWeight.w400,
                    //                 fontSize: 16.sp,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(height: 8.h),
                    //         Row(
                    //           children: [
                    //             Text(
                    //               MyConfigCach.getString(
                    //                   key: MyConfigCacheKeys.myUserName),
                    //               style: GoogleFonts.darkerGrotesque(
                    //                 color:
                    //                     AppColors.blackColor.withOpacity(0.9),
                    //                 height: 1.h,
                    //                 fontWeight: FontWeight.w400,
                    //                 fontSize: 16.sp,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //     CircleAvatar(
                    //       radius: 32.r,
                    //       backgroundColor: AppColors.transparentColor,
                    //       child: SvgPicture.asset('assets/svg/chef.svg'),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 25.h),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Select your Break time:',
                    //       style: GoogleFonts.darkerGrotesque(
                    //         color: AppColors.blackColor,
                    //         decoration: TextDecoration.underline,
                    //         height: 1.h,
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 20.sp,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 30.h),
                    // TextFormField(
                    //   controller: breakTimeController,
                    //   cursorColor: AppColors.darkGrey,
                    //   keyboardType: TextInputType.text,
                    //   validator: (value) {},
                    //   textInputAction: TextInputAction.next,
                    //   style: GoogleFonts.darkerGrotesque(
                    //     fontSize: 16.8.sp,
                    //     height: 1.h,
                    //     color: AppColors.black3Color,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.only(
                    //       bottom: 5.h,
                    //       left: 5.w,
                    //     ),
                    //     filled: true,
                    //     fillColor: AppColors.whiteColor.withOpacity(0.9),
                    //     hintText: 'For breakfast: month or week',
                    //     hintStyle: GoogleFonts.darkerGrotesque(
                    //       color: Colors.grey[500],
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 16.sp,
                    //       height: 1.h,
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.sp),
                    //       borderSide: BorderSide(
                    //         color: AppColors.greyColor,
                    //         width: 1.sp,
                    //       ),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.sp),
                    //       borderSide: BorderSide(
                    //         color: AppColors.greyColor,
                    //         width: 1.sp,
                    //       ),
                    //     ),
                    //     errorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.sp),
                    //       borderSide: BorderSide(
                    //         color: AppColors.errorColor,
                    //         width: 1.sp,
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.sp),
                    //       borderSide: BorderSide(
                    //         color: AppColors.darkGrey,
                    //         width: 1.sp,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //       width: 160.w,
                    //       child: TextFormField(
                    //         controller: lunchFromTimeController,
                    //         cursorColor: AppColors.darkGrey,
                    //         keyboardType: TextInputType.number,
                    //         validator: (value) {},
                    //         onChanged: (value) {
                    //           formatTime(lunchFromTimeController);
                    //         },
                    //         textInputAction: TextInputAction.next,
                    //         style: GoogleFonts.darkerGrotesque(
                    //           fontSize: 16.8.sp,
                    //           height: 1.h,
                    //           color: AppColors.black3Color,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.only(
                    //             bottom: 5.h,
                    //             left: 5.w,
                    //           ),
                    //           filled: true,
                    //           fillColor: AppColors.whiteColor.withOpacity(0.9),
                    //           hintText: 'For lunch: from ...',
                    //           hintStyle: GoogleFonts.darkerGrotesque(
                    //             color: Colors.grey[500],
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 16.sp,
                    //             height: 1.h,
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           errorBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.errorColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.darkGrey,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 160.w,
                    //       child: TextFormField(
                    //         controller: lunchToTimeController,
                    //         cursorColor: AppColors.darkGrey,
                    //         keyboardType: TextInputType.number,
                    //         validator: (value) {},
                    //         onChanged: (value) {
                    //           formatTime(lunchFromTimeController);
                    //         },
                    //         textInputAction: TextInputAction.next,
                    //         style: GoogleFonts.darkerGrotesque(
                    //           fontSize: 16.8.sp,
                    //           height: 1.h,
                    //           color: AppColors.black3Color,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.only(
                    //             bottom: 5.h,
                    //             left: 5.w,
                    //           ),
                    //           filled: true,
                    //           fillColor: AppColors.whiteColor.withOpacity(0.9),
                    //           hintText: 'For lunch: to ...',
                    //           hintStyle: GoogleFonts.darkerGrotesque(
                    //             color: Colors.grey[500],
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 16.sp,
                    //             height: 1.h,
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           errorBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.errorColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.darkGrey,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 10.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //       width: 160.w,
                    //       child: TextFormField(
                    //         controller: drinkFromTimeController,
                    //         cursorColor: AppColors.darkGrey,
                    //         keyboardType: TextInputType.number,
                    //         validator: (value) {},
                    //         onChanged: (value) {
                    //           formatTime(lunchFromTimeController);
                    //         },
                    //         textInputAction: TextInputAction.next,
                    //         style: GoogleFonts.darkerGrotesque(
                    //           fontSize: 16.8.sp,
                    //           height: 1.h,
                    //           color: AppColors.black3Color,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.only(
                    //             bottom: 5.h,
                    //             left: 5.w,
                    //           ),
                    //           filled: true,
                    //           fillColor: AppColors.whiteColor.withOpacity(0.9),
                    //           hintText: 'For drink: from ...',
                    //           hintStyle: GoogleFonts.darkerGrotesque(
                    //             color: Colors.grey[500],
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 16.sp,
                    //             height: 1.h,
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           errorBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.errorColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.darkGrey,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 160.w,
                    //       child: TextFormField(
                    //         controller: drinkToTimeController,
                    //         cursorColor: AppColors.darkGrey,
                    //         keyboardType: TextInputType.number,
                    //         validator: (value) {},
                    //         onChanged: (value) {
                    //           formatTime(lunchFromTimeController);
                    //         },
                    //         textInputAction: TextInputAction.next,
                    //         style: GoogleFonts.darkerGrotesque(
                    //           fontSize: 16.8.sp,
                    //           height: 1.h,
                    //           color: AppColors.black3Color,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.only(
                    //             bottom: 5.h,
                    //             left: 5.w,
                    //           ),
                    //           filled: true,
                    //           fillColor: AppColors.whiteColor.withOpacity(0.9),
                    //           hintText: 'For drink: to ...',
                    //           hintStyle: GoogleFonts.darkerGrotesque(
                    //             color: Colors.grey[500],
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 16.sp,
                    //             height: 1.h,
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.greyColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           errorBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.errorColor,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(10.sp),
                    //             borderSide: BorderSide(
                    //               color: AppColors.darkGrey,
                    //               width: 1.sp,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'BreakFast : ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
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
                    Divider(color: Colors.grey[500],thickness: 1),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Lunch : ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              "From : ",
                              style: TextStyle(fontSize: 20),
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
                              style: TextStyle(fontSize: 20),
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
                    Divider(color: Colors.grey[500],thickness: 1),
                    SizedBox(height: 25.h),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Drinks : ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              "From : ",
                              style: TextStyle(fontSize: 20),
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
                              style: TextStyle(fontSize: 20),
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
              print("""
.$lunchFrom,
.$lunchTO,
.$drinkFrom,
.$drinkTo
$chooseBreakFast
               """);
              },
            ),
          ),
        );
      },
    );
  }

  //
  // void formatTime(TextEditingController controller) {
  //   String text = controller.text.trim();
  //   String text2 = controller.text.trim();
  //   if (text.isNotEmpty && text.length <= 2) {
  //     int hours = int.parse(text);
  //     int minutes = int.parse(text2);
  //     if (hours != null) {
  //       String formattedTime = hours.toString().padLeft(2, '0') + ':${minutes.toString().padLeft(2)}';
  //       if (formattedTime != controller.text) {
  //         controller.value = controller.value.copyWith(
  //           text: formattedTime,
  //           selection: TextSelection.collapsed(offset: formattedTime.length),
  //         );
  //       }
  //     }
  //   }
  // }

  void formatTime(TextEditingController controller) {
    String text = controller.text.trim();
    if (text.isNotEmpty && text.length <= 2) {
      int hours = int.parse(text);
      if (hours != null) {
        String formattedTime = hours.toString().padLeft(2, '0') + ':00';
        if (formattedTime != controller.text) {
          controller.value = controller.value.copyWith(
            text: formattedTime,
            selection: TextSelection.collapsed(offset: formattedTime.length),
          );
        }
      }
    }
  }
}
