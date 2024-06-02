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
          margin: EdgeInsets.only(top: 0.h),
          width: 380.w,
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0.h, left: 15.w,bottom: 20.h),
                      width: 45.w,
                      height: 45.h,
                      child: CircleAvatar(
                        backgroundColor: kGrey200Color,
                        backgroundImage: AssetImage("assets/images/test/man.png"),
                      ),
                    ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         margin: EdgeInsets.only(left: 5.w, top: 3.h),
                         child: FRegularText("Welcome Find Life", kTextBlackColor, 15),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 5.w, top: 5.h),
                         child: FBoldText("Minseok!", kTextBlackColor, 15),
                       )
                     ],
                   )
                  ],
                ),
              ),
            ],
          ),
        ),


      ],
    );
  }
}

