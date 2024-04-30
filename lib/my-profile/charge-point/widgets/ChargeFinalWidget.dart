
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/charge-point/controller/ChargePointController.dart';


Widget ChargeFinalWidget(ChargePointController _controller){
  return Container(
    color: kWhiteBackGroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 100.h),
            child: Title2Text("충전하시겠습니까?", kTextBlackColor),
          ),
        ),
        Center(
          child: Container(
            width: 170.w,
            height: 47.h,
            margin: EdgeInsets.only(top: 20.h, right: 10.w),
            //color: kBlueColor,
            child: Center(child: NumberText(_controller.priceController.text, kTextBlackColor, 14))
          ),
        ),
      ],
    ),
  );
}