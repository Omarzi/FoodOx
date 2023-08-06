import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:food_ox/features/auth/data/data_provider/local/my_config_cache_keys.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 32.r,
                backgroundColor: AppColors.transparentColor,
                child: SvgPicture.asset('assets/svg/chef.svg'),
              ),
              accountEmail: Text(
                'omar@gmail.com',
                style: GoogleFonts.darkerGrotesque(
                  fontWeight: FontWeight.w600,
                  height: 1.h,
                  fontSize: 16.sp,
                ),
              ),
              accountName: Text(
                'Omar Abdel Aziz',
                style: GoogleFonts.darkerGrotesque(
                  fontWeight: FontWeight.w600,
                  height: 2.h,
                  fontSize: 24.sp,
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.standardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: Text(
                'Support',
                style: GoogleFonts.darkerGrotesque(
                  fontWeight: FontWeight.w600,
                  height: 1.h,
                  fontSize: 24.sp,
                ),
              ),
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) => const MyHomePage(
                //       title: 'Houses',
                //     ),
                //   ),
                // );
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 18.sp,),
            ),
            ListTile(
              leading: const Icon(Icons.logout_sharp, color: AppColors.errorColor,),
              title: Text(
                'Logout',
                style: GoogleFonts.darkerGrotesque(
                  fontWeight: FontWeight.w600,
                  color: AppColors.errorColor,
                  height: 1.h,
                  fontSize: 24.sp,
                ),
              ),
              onTap: () {
                MyConfigCach.removeFromShared(
                    key: MyConfigCacheKeys.roles);
                MyConfigCach.removeFromShared(
                    key: MyConfigCacheKeys.token);
                Navigator.pushReplacementNamed(context, 'loginScreen');
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 18.sp, color: AppColors.errorColor,),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.transparentColor,
        elevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.darkerGrotesque(
            color: AppColors.blackColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            height: 1.h,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: AppColors.transparentColor,
            child: SvgPicture.asset('assets/svg/chef.svg'),
          ),
        ],
        iconTheme: const IconThemeData(
          color: AppColors.standardColor, // Replace with your desired color
        ),
      ),
    );
  }
}
