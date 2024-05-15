
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';


Container IntroduceProfileWidget(){
  return Container(
    width: 340.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: kGrey200Color)
    ),
    margin: EdgeInsets.only(left: 15.w, top: 10.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 15.h),
          child: CircleAvatar(
            backgroundColor: kGrey200Color,
            backgroundImage: AssetImage("assets/images/test/man.png"),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w,top: 15.h),
              child: FBoldText("sinminseok", kGrey800Color, 16),
            ),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 5.h),
                child: FRegularText("Hi My name is minseok", kGrey500Color, 14)
            )
          ],
        )
      ],
    ),
  );
}