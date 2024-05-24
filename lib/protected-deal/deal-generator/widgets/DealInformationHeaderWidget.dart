
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';

Widget DealInformationHeaderWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.w, top: 15.h),
        child: Title2Text("거래 매물", kTextBlackColor),
      ),
      Center(
        child: Container(
          width: 350.w,
          height: 100.h,
          decoration: BoxDecoration(
              color: kBackgroundBlue,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: kGrey100Color)
          ),
          
          margin: EdgeInsets.only(top: 15.h, left: 0.w),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 0.w),
                  width: 85.w,
                  height: 100.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      "assets/images/test/home.png",
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 10.w,top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: SubTitle2Text("2000 \$", kTextBlackColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h),
                      child: Helper2Text(
                          "WAS 멜버른 City 이름 4300", kGrey500Color),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}