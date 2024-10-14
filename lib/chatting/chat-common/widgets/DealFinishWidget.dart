


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/my-profile/my-deals/done-detail/view/DealDoneDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/deal/response/ProtectedDealResponse.dart';

Widget DealFinishWidget(ProtectedDealResponse deal){
  return Container(
    width: 220.w,
    height: 260.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: kGrey200Color)
      //color: kGrey200Color
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 18.h, left: 13.w),
            child: Title3Text("Transaction completed!", kDarkBlue)),
        Container(
          margin: EdgeInsets.only(top: 3.h, left: 13.w),
          child: Helper2Text("\nThe transaction was completed safely!\n\nThank you for using our secure transaction service.", kGrey600Color),
        ),
        InkWell(
          onTap: (){
            Get.to(() => DealDoneDetailView(deal!));
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 40.h),
              width: 200.w,
              height: 35.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: kLightBlue),
              child: Center(child: Helper2Text("Transaction Information", kDarkBlue)),
            ),
          ),
        )
      ],
    ),
  );
}