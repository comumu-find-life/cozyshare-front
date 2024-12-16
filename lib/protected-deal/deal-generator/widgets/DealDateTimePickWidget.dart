import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/DealGeneratorController.dart';

class DealDateTimePickWidget extends StatefulWidget {
  DealGeneratorController _controller;

  DealDateTimePickWidget(this._controller);

  @override
  State<DealDateTimePickWidget> createState() => _DealDateTimePickWidgetState();
}

class _DealDateTimePickWidgetState extends State<DealDateTimePickWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBondText(),
        Container(
          margin: EdgeInsets.only(top: 10.h, left: 20.w),
          child: Row(
            children: [
              // 시간 선택
              Container(
                width: 100.w,
                height: 40.h,
                child: TimePickerSpinnerPopUp(
                  cancelTextStyle: TextStyle(color: kTextBlackColor),
                  confirmTextStyle: TextStyle(color: kTextBlackColor),
                  textStyle: TextStyle(color: kTextBlackColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
                  mode: CupertinoDatePickerMode.time,
                  initTime: widget._controller.selectDatetime,
                  onChange: (dateTime) {
                    setState(() {
                      // 시간을 변경하고, 기존 날짜를 유지
                      widget._controller.selectDatetime = DateTime(
                        widget._controller.selectDatetime.year,
                        widget._controller.selectDatetime.month,
                        widget._controller.selectDatetime.day,
                        dateTime.hour,
                        dateTime.minute,
                      );
                    });
                  },
                ),
              ),
              // 날짜 선택
              Container(
                margin: EdgeInsets.only(left: 10.w),
                width: 140.w,
                height: 40.h,
                child: TimePickerSpinnerPopUp(
                  locale: Locale('en'),
                  mode: CupertinoDatePickerMode.date,
                  textStyle: TextStyle(
                    color: kTextBlackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  initTime: widget._controller.selectDatetime,
                  barrierColor: Colors.black12, // Barrier Color when popup shows
                  minuteInterval: 1,
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  cancelText: 'Cancel',
                  cancelTextStyle: TextStyle(color: kTextBlackColor),
                  confirmText: 'OK',
                  confirmTextStyle: TextStyle(color: kTextBlackColor),
                  pressType: PressType.singlePress,
                  timeFormat: 'dd/MM/yyyy',
                  onChange: (dateTime) {
                    setState(() {
                      // 날짜를 변경하고, 기존 시간을 유지
                      widget._controller.selectDatetime = DateTime(
                        dateTime.year,
                        dateTime.month,
                        dateTime.day,
                        widget._controller.selectDatetime.hour,
                        widget._controller.selectDatetime.minute,
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBondText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w),
      child: Row(
        children: [
          Container(
            child: Title2Text("Meeting date", kTextBlackColor),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 5.w),
              child: Icon(
                Icons.report,
                color: kDarkBlue,
                size: 18.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
