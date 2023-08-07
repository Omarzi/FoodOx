import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ox/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCheckBoxComponent extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  bool chosseBreakFast ;

  EditCheckBoxComponent({required this.onThemeChanged,required this.chosseBreakFast});

  @override
  _EditCheckBoxComponentState createState() =>
      _EditCheckBoxComponentState();
}

class _EditCheckBoxComponentState extends State<EditCheckBoxComponent> {

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
            value: !widget.chosseBreakFast,
            onChanged: (bool? value) {
              setState(() {
                widget.chosseBreakFast = !value!;
                widget.onThemeChanged(widget.chosseBreakFast);
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
          value: widget.chosseBreakFast,
          onChanged: (bool? value) {
            setState(() {
              widget.chosseBreakFast = value!;
              widget.onThemeChanged(widget.chosseBreakFast);
            });
          },
        ),
      ],
    );
  }
}
