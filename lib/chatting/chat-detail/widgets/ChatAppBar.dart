import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../protected-deal/deal-generator/view/DealGeneratorViewByProvider.dart';

AppBar ChatAppBar(BuildContext context, ChatDetailController controller,bool isProvider) {
  return AppBar(
    backgroundColor: kGrey100Color,
    toolbarHeight: 55.h,
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
                    margin: EdgeInsets.only(bottom: 10.h),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kTextBlackColor,
                        size: 18.sp,
                      )),
                ),

              ],
            ),
            isProvider?InkWell(
              onTap: () {
                Get.to(() => DealGeneratorViewByProvider(controller));
              },
              child: Container(
                margin: EdgeInsets.only(right: 5.w, bottom: 10.h),
                width: 120.w,
                height: 35.h,
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
                            FRegularText("안전거래 시작하기", kWhiteBackGroundColor, 13)),
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