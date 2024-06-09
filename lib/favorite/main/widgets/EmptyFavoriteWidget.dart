

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

Widget EmptyFavoruteWidget() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: kGrey200Color)
      ),
      width: 340.w,
      height: 610.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: FRegularText("Find Rooms!", kGrey500Color, 14),
            )
          ],
        ),
      ),
    ),
  );
}