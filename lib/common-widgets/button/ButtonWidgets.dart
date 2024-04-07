
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

Widget NextButtonWidget(String title) {
  return Container(
    width: 320.w,
    height: 60.h,
    decoration: BoxDecoration(
        color: kBlueColor,
        borderRadius: BorderRadius.all(Radius.circular(6))
    ),
    child: Center(
      child: ButtonText(title, kWhiteBackGroundColor),
    ),
  );

}

Widget NotYetButtonWidget(String title) {
  return Container(
    width: 320.w,
    height: 60.h,
    decoration: BoxDecoration(
        color: kGrey200Color,
        borderRadius: BorderRadius.all(Radius.circular(6))
    ),
    child: Center(
      child: ButtonText(title, kWhiteBackGroundColor),
    ),
  );

}