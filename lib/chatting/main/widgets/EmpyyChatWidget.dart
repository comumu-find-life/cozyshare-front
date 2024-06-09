
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

Widget EmptyChatWidget() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      border: Border.all(color: kGrey200Color)
    ),
    width: 340.w,
    height: 540.h,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: FRegularText("Start to contact!", kGrey500Color, 14),
          )
        ],
      ),
    ),
  );
}