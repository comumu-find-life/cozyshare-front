import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../protected-deal/deal-generator_by_provider/view/DealGeneratorViewByProvider.dart';

AppBar ChatAppBar(BuildContext context, bool isProvider) {
  return AppBar(
    backgroundColor: kBackgroundBlue,
    toolbarHeight: 60,
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kTextBlackColor,
                        size: 18.sp,
                      )),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubTitle1Text("신민석", kTextBlackColor)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isProvider?InkWell(
              onTap: () {
                Get.to(() => DealGeneratorViewByProvider());
              },
              child: Container(
                margin: EdgeInsets.only(right: 5.w, top: 0.h),
                width: 120.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: kDarkBlue),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10.w, left: 5.w),
                            child:
                            Helper2Text("안전거래 시작하기", kWhiteBackGroundColor)),
                      ],
                    )),
              ),
            ):Container()
          ],
        ),
      ],
    ),
    automaticallyImplyLeading: false,
    elevation: 0,
  );
}