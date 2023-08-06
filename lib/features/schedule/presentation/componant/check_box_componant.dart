import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSelectionComponent extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  ThemeSelectionComponent({required this.onThemeChanged});

  @override
  _ThemeSelectionComponentState createState() =>
      _ThemeSelectionComponentState();
}

class _ThemeSelectionComponentState extends State<ThemeSelectionComponent> {
  bool chosseBreakFast = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: CheckboxListTile(
            activeColor: AppColors.standardColor,
            title: Text(
              'Week',
              style: GoogleFonts.darkerGrotesque(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            value: !chosseBreakFast,
            onChanged: (bool? value) {
              setState(() {
                chosseBreakFast = !value!;
                widget.onThemeChanged(chosseBreakFast);
              });
            },
          ),
        ),
        CheckboxListTile(
          activeColor: AppColors.standardColor,
          title: Text(
            'Month',
            style: GoogleFonts.darkerGrotesque(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          value: chosseBreakFast,
          onChanged: (bool? value) {
            setState(() {
              chosseBreakFast = value!;
              widget.onThemeChanged(chosseBreakFast);
            });
          },
        ),
      ],
    );
  }
}
