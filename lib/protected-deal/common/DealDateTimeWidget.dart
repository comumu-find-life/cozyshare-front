

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/Colors.dart';
import '../../constants/Fonts.dart';

Widget DealDateTimeWidget(String dateTime){
  return Center(
    child: Container(
      margin: EdgeInsets.only(left: 5.w, top: 20.h),
      width: 350.w,
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: kGrey200Color)),
      child: Container(
        width: 140.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Body2Text("Meeting Date", kGrey600Color),
            ),
            Container(
              margin: EdgeInsets.only(right: 20.w),
              child: NumberText("${dateTime}", kTextBlackColor, 14),
            )
          ],
        ),
      ),
    ),
  );
}