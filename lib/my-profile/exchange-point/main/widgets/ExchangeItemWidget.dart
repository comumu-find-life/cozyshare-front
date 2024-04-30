import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';

Widget ExchangeHistoryItem() {
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 380.w,
    height: 110.h,
    decoration: BoxDecoration(color: kBackgroundBlue),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 330.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberText("2024.10.21 19:14", kGrey700Color, 13),
              NumberText("2000\$", kTextBlackColor, 12)
            ],
          ),
        ),
        Container(
          width: 330.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Helper2Text("출금 완료", kTextBlackColor),
              )
            ],
          ),
        )
      ],
    )
  );
}
