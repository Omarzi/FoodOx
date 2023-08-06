import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache_keys.dart';
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

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

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
                      'Foodox',
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
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (MyConfigCach.getString(key: MyConfigCacheKeys.token) == '') {
          Navigator.pushReplacementNamed(context, 'loginScreen');
        } else if (MyConfigCach.getString(key: MyConfigCacheKeys.token)
            .isNotEmpty) {
          Navigator.pushReplacementNamed(context, 'breakfastScreen');
        }
      },
    );
  }
}
