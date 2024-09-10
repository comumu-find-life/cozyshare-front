

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
    width: 250.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      border: Border.all(color: kGrey100Color),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.h, left: 13.w),
          child: Title3Text("Request for Deposit Payment", kTextBlackColor),
        ),
        Padding(

          padding: EdgeInsets.only(top: 3.h, left: 13.w, bottom: 20.h),
          child: Helper2Text("Deposit : ${dealResponse?.deposit} \$", kGrey400Color),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: InkWell(
              onTap: () {
                Get.to(() => DealRequestViewByGetter(controller));
              },
              child: Container(
                width: 230.w,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: kLightBlue,
                ),
                child: Center(
                  child: Helper2Text(
                    "Make a Payment",
                    kDarkBlue,
                  ),
                ),
              ),

            ),
          ),
        ),
      ],
    ),
  );
}