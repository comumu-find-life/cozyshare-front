

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/chatting/chat-detail-getter/controller/ChatProviderDetailController.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/deal/response/ProtectedDealByGetterResponse.dart';
import '../../../protected-deal/deal-request/getter/view/DealRequestViewByGetter.dart';

Widget GetterDealStartMessageWidget(ChatGetterDetailController controller){
  ProtectedDealByGetterResponse? dealResponse = controller.dealResponse;
  return Container(
    width: 200.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      border: Border.all(color: kGrey100Color),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.h, left: 13.w),
          child: Title3Text("보증금/계약금 입금 요청", kTextBlackColor),
        ),
        Padding(

          padding: EdgeInsets.only(top: 3.h, left: 13.w, bottom: 20.h),
          child: Helper2Text("계약금/보증금 : ${dealResponse?.deposit} \$", kGrey400Color),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: InkWell(
              onTap: () {
                Get.to(() => DealRequestViewByGetter(controller));
                // if (controller.isProvider()) {
                //   //todo DealRequestViewByProvider 로 변경
                //   Get.to(() => DealRequestViewByProvider(controller));
                // } else {
//                Get.to(() => DealRequestViewByGetter(controller));
                // }
              },
              child: Container(
                width: 170.w,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: kLightBlue,
                ),
                child: Center(
                  child: Helper2Text(
                    "입금 하기",
                    kDarkBlue,
                  ),
                ),
              ),
              // child: Container(
              //   width: 170.w,
              //   height: 35.h,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(8)),
              //     color: kLightBlue,
              //   ),
              //   child: Center(
              //     child: Helper2Text(
              //       controller.currentUser.isProvider ? "거래 정보 확인" : "입금 하기",
              //       kDarkBlue,
              //     ),
              //   ),
              // ),
            ),
          ),
        ),
      ],
    ),
  );
}