import 'package:flutter/material.dart';
import 'package:food_ox/styles/app_colors.dart';

class EditWeekdaySelectionWidget extends StatefulWidget {
  EditWeekdaySelectionWidget({required this.chossenList});

  List<int> chossenList;

  @override
  _EditWeekdaySelectionWidgetState createState() => _EditWeekdaySelectionWidgetState();
}

class _EditWeekdaySelectionWidgetState extends State<EditWeekdaySelectionWidget> {
  List<String> weekdays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  // List<int> weekdaysInt =[0,1,2,3,4,5,6];
  // List<String> selectedWeekdays = [];

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
          value: widget.chossenList.contains(index),
          onChanged: (bool? value) {
            setState(() {
              if (value!) {

                widget.chossenList.add(index);
              } else {
                widget.chossenList.remove(index);
              }
            });
            // print(selectedWeekdays);
            print(widget.chossenList);
          },
        );
      },
    );
  }
}
