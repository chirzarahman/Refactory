import 'package:flutter/material.dart';

import '../../theme.dart';

class TodoList extends StatelessWidget {
  final String time;
  final String timeRange;
  final String title;
  final int statusBg;
  final int statusTitle;
  final int statusRange;

  const TodoList({
    Key? key,
    required this.time,
    required this.timeRange,
    required this.title,
    required this.statusBg,
    required this.statusTitle,
    required this.statusRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (statusBg) {
        case 0:
          return kSamePrimaryColor;
        case 1:
          return kSameYellowColor;
        case 2:
          return kSameRedColor;
        default:
          return kBlueColor;
      }
    }

    titleColor() {
      switch (statusTitle) {
        case 0:
          return blueTextStyle;
        case 1:
          return yellowTextStyle;
        case 2:
          return redTextStyle;
        default:
          return blueTextStyle;
      }
    }

    rangeColor() {
      switch (statusRange) {
        case 0:
          return blueTextStyle;
        case 1:
          return yellowTextStyle;
        case 2:
          return redTextStyle;
        default:
          return blueTextStyle;
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 8,
                height: 1,
                color: kGreyColor,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            margin: EdgeInsets.only(left: 57),
            decoration: BoxDecoration(
                color: backgroundColor(),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: titleColor().copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 10,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icon_more_vert.png'))),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  timeRange,
                  style: rangeColor().copyWith(
                    fontSize: 10,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kSameRedColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  size: 15,
                  color: kRedColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Complete',
                  style: redTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
