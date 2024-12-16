

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/ReservationGeneratorController.dart';

class ReservationDatetimePick extends StatefulWidget {
  ReservationGeneratorController _reservationGeneratorController;


  ReservationDatetimePick(this._reservationGeneratorController);

  @override
  State<ReservationDatetimePick> createState() => _ReservationDatetimePick();
}

class _ReservationDatetimePick extends State<ReservationDatetimePick> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 15.h),
          child: Title2Text("Select a date and time", kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 15.h),
          child: Row(

            children: [
              Container(
                width: 100.w,
                height: 40.h,
                child: TimePickerSpinnerPopUp(

                  confirmTextStyle: TextStyle(color: kTextBlackColor),
                  textStyle:  TextStyle(color: kTextBlackColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
                  mode: CupertinoDatePickerMode.time,
                  initTime: DateTime.now(),
                  onChange: (dateTime) {
                    // Implement your logic with select dateTime
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                width: 140.w,
                height: 40.h,
                child: TimePickerSpinnerPopUp(
                  locale: Locale('en'),
                  mode: CupertinoDatePickerMode.date,
                  textStyle: TextStyle(color: kTextBlackColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
                  initTime: DateTime.now(),
                  minTime: DateTime.now().subtract(const Duration(days: 10)),
                  maxTime: DateTime.now().add(const Duration(days: 10)),
                  barrierColor: Colors.black12, //Barrier Color when pop up show
                  minuteInterval: 1,
                  padding : const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  cancelText : 'Cancel',
                  cancelTextStyle: TextStyle(color: kTextBlackColor),
                  confirmText : 'OK',
                  confirmTextStyle: TextStyle(color: kTextBlackColor),
                  pressType: PressType.singlePress,
                  timeFormat: 'dd/MM/yyyy',
                  // Customize your time widget
                  // timeWidgetBuilder: (dateTime) {},
                  onChange: (dateTime) {
                    // Implement your logic with select dateTime
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
