// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSelectionComponent extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onChanged;

  const TimeSelectionComponent(
      {super.key, required this.initialTime, required this.onChanged});

  @override
  _TimeSelectionComponentState createState() => _TimeSelectionComponentState();
}

class _TimeSelectionComponentState extends State<TimeSelectionComponent> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime;
  }

  // Future<void> _showTimePicker() async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  Future<void> _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primaryColor: AppColors.standardColor,
            focusColor:  AppColors.standardColor,
            backgroundColor: Colors.white,
            dialogBackgroundColor: Colors.grey,
            textTheme: TextTheme(
              subtitle1: GoogleFonts.darkerGrotesque(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                height: 1.h,
                fontSize: 18.sp,
              ),
              button: GoogleFonts.darkerGrotesque(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                height: 1.h,
                fontSize: 18.sp,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        widget.onChanged(selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showTimePicker,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 8.w),
            Icon(
              Icons.access_time,
              size: 20.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              selectedTime.format(context),
              style: GoogleFonts.darkerGrotesque(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                height: 1.h,
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
