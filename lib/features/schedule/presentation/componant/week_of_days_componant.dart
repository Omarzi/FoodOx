import 'package:flutter/material.dart';
import 'package:food_ox/styles/app_colors.dart';

class WeekdaySelectionWidget extends StatefulWidget {
  WeekdaySelectionWidget({required this.chossenList});

  List<int> chossenList;

  @override
  _WeekdaySelectionWidgetState createState() => _WeekdaySelectionWidgetState();
}

class _WeekdaySelectionWidgetState extends State<WeekdaySelectionWidget> {
  List<String> weekdays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<String> selectedWeekdays = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: weekdays.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          activeColor: AppColors.standardColor,

          title: Text(weekdays[index]),
          value: selectedWeekdays.contains(weekdays[index]),
          onChanged: (bool? value) {
            setState(() {
              if (value!) {
                selectedWeekdays.add(weekdays[index]);
                widget.chossenList.add(index);
              } else {
                selectedWeekdays.remove(weekdays[index]);
                widget.chossenList.remove(index);
              }
            });
            print(selectedWeekdays);
            print(widget.chossenList);
          },
        );
      },
    );
  }
}
