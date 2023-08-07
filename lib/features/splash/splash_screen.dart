import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/config/app_routes.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:food_ox/features/categries/managers/categories_cubit.dart';
import 'package:food_ox/features/schedule/managers/schedule_cubit.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigationToHome();
  }

  //
  // @override
  // void dispose() {
  //   animationController!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: fadingAnimation!,
                builder: (context, child) {
                  return Opacity(
                    opacity: fadingAnimation!.value,
                    child: Text(
                      'Welcome',
                      style: GoogleFonts.poppins(
                        color: AppColors.standardColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                      ),
                    ),
                  );
                }),
            SizedBox(height: 22.h),
            AnimatedBuilder(
              animation: fadingAnimation!,
              builder: (context, child) {
                return Opacity(
                  opacity: fadingAnimation!.value,
                  child: SvgPicture.asset(
                    'assets/svg/chef.svg',
                    width: 100.w,
                    height: 99.h,
                  ),
                );
              },
            ),
            AnimatedBuilder(
                animation: fadingAnimation!,
                builder: (context, child) {
                  return Opacity(
                    opacity: fadingAnimation!.value,
                    child: Text(
                      'Food Ox',
                      style: GoogleFonts.poppins(
                        color: AppColors.standardColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                      ),
                    ),
                  );
                }),


            SizedBox(height: 22.h),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController!.repeat(reverse: true);
  }

  void navigationToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      if (MyConfigCach.getString(key: MyConfigCacheKeys.token) == '') {
        Navigator.pushReplacementNamed(context, 'loginScreen');
      } else if (MyConfigCach.getString(key: MyConfigCacheKeys.token)
          .isNotEmpty) {
        Navigator.pushNamed(context, RoutePath.landingScreen);

        // var scheduleCubit = BlocProvider.of<ScheduleCubit>(context);
        // var categoryCubit = BlocProvider.of<CategoriesCubit>(context);
        // if (scheduleCubit.getScheduleModel != null &&
        //     categoryCubit.getUserMenuModel != null) {
        //   if (scheduleCubit.getScheduleModel!.exists == true &&
        //       categoryCubit.getUserMenuModel!.exists == true) {
        //     log("1111111111111");
        //     // Navigator.pushReplacementNamed(context, RoutePath.layoutScreen);
        //   } else if (scheduleCubit.getScheduleModel!.exists == true &&
        //       categoryCubit.getUserMenuModel!.exists == false) {
        //     log("222222222222");
        //
        //     // Navigator.pushReplacementNamed(context, RoutePath.breakFastScreen,arguments: '');
        //   } else if (scheduleCubit.getScheduleModel!.exists == false &&
        //       categoryCubit.getUserMenuModel!.exists == true) {
        //     log("333333333333");
        //
        //     // Navigator.pushReplacementNamed(context, RoutePath.scheduleScreen);
        //   } else {
        //     log("4444444444444");
        //
        //     // Navigator.pushReplacementNamed(context, RoutePath.breakFastScreen,arguments: '');
        //   }
        // }
      }
    });
  }
}
