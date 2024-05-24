import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../constants/Colors.dart';


class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h),
          width: 380.w,
          height: 120.h,
          color: kDarkBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0.h, left: 20.w),
                      width: 45.w,
                      height: 45.h,
                      child: CircleAvatar(
                        backgroundColor: kGrey200Color,
                        backgroundImage: AssetImage("assets/images/test/man.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.w),
                      child: FBoldText("Hi, Minseok", kWhiteBackGroundColor, 15),
                    )
                  ],
                ),
              ),
              Container(
                width: 35.w,
                height: 35.h,
                margin: EdgeInsets.only(right: 15.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kWhiteBackGroundColor)),
                child: Center(
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: kWhiteBackGroundColor,
                    size: 15.sp,
                  ),
                ),
              )
            ],
          ),
        ),


      ],
    );
  }
}

