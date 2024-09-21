
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class SafeDealWidget extends StatelessWidget {
  const SafeDealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        // border: Border.all(color: kGrey400Color),
      ),
      width: 330.w,
      margin: EdgeInsets.only(left: 10.w, bottom: 10.h),
      height: 130.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h, left: 0.w),
              child: FBoldText("What is the secure transaction?", kTextBlackColor, 16)),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 45.w,
                height: 45.h,
                child: Image.asset("assets/icons/deal_icon.png"),
              ),
              Container(

                width: 230.w,
                  margin: EdgeInsets.only(top: 20.h,right: 5.w, left: 10.w),
                  child: FRegularText("We safely return the deposit to the homeowner!", kTextBlackColor, 14)),
            ],
          )
        ],
      ),
    );
  }
}
