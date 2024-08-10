
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

Widget DealRoomInformationWidget() {
  return Container(
    width: 380.w,
    color: kWhiteBackGroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h, left: 20.w),
          child: FBoldText("매물 정보", kTextBlackColor, 14),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 15.h, left: 0.w),
            width: 350.w,
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: kGrey400Color),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 13.w),
                  width: 140.w,
                  height: 170.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset(
                        "assets/images/test/home.png",
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Column(
                    children: [
                      Container(
                        width: 170.w,
                        margin: EdgeInsets.only(top: 20.h),
                        child: FBoldText("Addresss", kTextBlackColor, 14),
                      ),
                      Container(
                        width: 170.w,
                        margin: EdgeInsets.only(top: 20.h),
                        child: FBoldText("Rent : 5000", kTextBlackColor, 13),
                      ),
                      Container(
                        width: 170.w,
                        margin: EdgeInsets.only(top: 20.h),
                        child: FBoldText("Bill : 500 ", kTextBlackColor, 13),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}