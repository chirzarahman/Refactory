import 'package:flutter/material.dart';
import 'package:refactory_test/theme.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DateTimeItem extends StatefulWidget {
  const DateTimeItem({Key? key}) : super(key: key);

  @override
  _DateTimeItemState createState() => _DateTimeItemState();
}

class _DateTimeItemState extends State<DateTimeItem> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: kBlueColor,
            selectedTextColor: kWhiteColor,
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ],
      ),
    );
  }
}
