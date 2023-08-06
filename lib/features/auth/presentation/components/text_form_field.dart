import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String? Function(String?)? validator;
  String hintText;

  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.type,
    required this.validator,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.darkGrey,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      textInputAction: TextInputAction.next,
      style: GoogleFonts.darkerGrotesque(
        fontSize: 16.8.sp,
        // height: 0.1.h,
        height: 1.h,
        color: AppColors.black3Color,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          // bottom: MediaQuery.of(context).size.height / 36,
          bottom: 5.h,
          left: 15.w,
          // left: MediaQuery.of(context).size.width * 0.03,
        ),
        filled: true,
        fillColor: AppColors.whiteColor.withOpacity(0.9),
        hintText: hintText,
        hintStyle: GoogleFonts.darkerGrotesque(
          color: Colors.grey[500],
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          height: 1.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1.sp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1.sp,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1.sp,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.darkGrey,
            width: 1.sp,
          ),
        ),
      ),
    );
  }
}
