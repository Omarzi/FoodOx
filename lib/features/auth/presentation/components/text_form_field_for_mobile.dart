// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldForMobile extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String? Function(String?)? validator;
  String prefix;
  String hintText;

  CustomTextFormFieldForMobile({
    Key? key,
    required this.controller,
    required this.type,
    required this.validator,
    required this.prefix,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.darkGrey,
      keyboardType: type,
      validator: validator,
      textInputAction: TextInputAction.next,
      style: GoogleFonts.darkerGrotesque(
        fontSize: 16.8.sp,
        height: 1.h,
        color: AppColors.black3Color,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          bottom: 5.h,
          left: 5.w,
        ),
        filled: true,
        fillColor: AppColors.whiteColor.withOpacity(0.9),
        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              prefix,
              style: GoogleFonts.darkerGrotesque(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                height: 1.h,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
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
