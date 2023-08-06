import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton {
  static normalButton({
    required String title,
    VoidCallback? onPress,
    Color? backgroundColor = AppColors.darkGrey,
    Color? titleColor = Colors.white,
    double fontSize = 16,
    bool shadow = true,
    double height = 50,
    double width = double.infinity,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: shadow
              ? [
                  BoxShadow(color: AppColors.lightGrey, blurRadius: 5.r),
                ]
              : null,
        ),
        child: Text(
          title,
          style: GoogleFonts.darkerGrotesque(
            height: 1.h,
            color: titleColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
