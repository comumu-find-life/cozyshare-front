
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../protected-deal/deal-proceeding/getter/view/DealProcessViewByGetter.dart';
import '../controller/ChatGetterDetailController.dart';

Widget GetterDealDuringMessageWidget(int dealId, ChatGetterDetailController controller){
  var dealResponse = controller.getDealById(dealId);
  return Container(
    width: 230.w,
    height: 150.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: kGrey100Color)
      //color: kGrey200Color
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 18.h, left: 13.w),
            child: Title3Text("Transaction in Progress", kDarkBlue)),
        Container(
          margin: EdgeInsets.only(top: 3.h, left: 13.w),
          child: Helper2Text("State : ${dealResponse!.dealState.description}", kGrey600Color),
        ),
        InkWell(
          onTap: (){
            Get.to(() => DealProcessViewByGetter(dealId, controller));
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 200.w,
              height: 35.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: kLightBlue),
              child: Center(child: Helper2Text("Check", kDarkBlue)),
            ),
          ),
        )

      ],
    ),
  );
}