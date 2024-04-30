

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';

Widget DealItemWidget(){
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 380.w,
    height: 110.h,
    decoration: BoxDecoration(
        color: kBackgroundBlue
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                width: 100.w,
                height: 140.h,
                child: ClipRRect(
                  borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.zero,
                  ),
                  child: Image.asset(
                    "assets/images/test/home.png",
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 10.h,left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Body2Text("거래금액 : ", kGrey700Color),
                      NumberText("3000\$", kGrey700Color, 13)
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 4.h),
                    child: Row(
                      children: [
                        Body2Text("거래날짜 : ", kGrey700Color),
                        NumberText("2024.03.21", kGrey700Color, 13)
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 14.h),
                    child: Row(
                      children: [
                        Body2Text("거래인 : ", kGrey700Color),
                        Body2Text("신민석", kGrey700Color)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 15.w),
          child: Icon(Icons.keyboard_arrow_right_outlined, color: kDarkBlue,),
        )
      ],
    ),
  );
}