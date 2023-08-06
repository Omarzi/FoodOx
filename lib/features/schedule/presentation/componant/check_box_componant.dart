import 'package:flutter/material.dart';
import 'package:food_ox/styles/app_colors.dart';

class ThemeSelectionComponent extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  ThemeSelectionComponent({required this.onThemeChanged});

  @override
  _ThemeSelectionComponentState createState() => _ThemeSelectionComponentState();
}

class _ThemeSelectionComponentState extends State<ThemeSelectionComponent> {
  bool chosseBreakFast = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(

          activeColor: AppColors.standardColor,
          title: Text('Week'),
          value: !chosseBreakFast,
          onChanged: (bool? value) {
            setState(() {
              chosseBreakFast = !value!;
              widget.onThemeChanged(chosseBreakFast);
            });
          },
        ),
        CheckboxListTile(
          activeColor: AppColors.standardColor,
          title: Text('Month'),
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