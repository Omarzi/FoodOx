import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackBarComponent {
  static snackBar({
    required String content,
  }) {
    return SnackBar(
      backgroundColor: AppColors.darkGrey,
      content: Text(
        content,
        style: GoogleFonts.darkerGrotesque(
          height: 1,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
