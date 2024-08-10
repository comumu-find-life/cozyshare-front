
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../protected-deal/deal-proceeding/getter/view/DealProcessViewByGetter.dart';
import '../controller/ChatProviderDetailController.dart';

Widget GetterDealDuringMessageWidget(ChatGetterDetailController controller){
  return Container(
    width: 200.w,
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
            child: Title3Text("거래 진행 중", kDarkBlue)),
        Container(
          margin: EdgeInsets.only(top: 3.h, left: 13.w),
          child: Helper2Text("상태 : ${controller.dealResponse!.dealState.description}", kGrey600Color),
        ),
        InkWell(
          onTap: (){
            //print(controller.dealResponse);
            Get.to(() => DealProcessViewByGetter(controller));


            // //todo 변경
            // if(controller.isProvider()){
//               Get.to(() => DealProcessViewByProvider(controller));
            // }else{
            //   Get.to(() => DealProcessViewByGetter(controller));
            //
            // }

            //Get.to(() => DealProcessViewByProvider(controller));
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 170.w,
              height: 35.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: kLightBlue),
              child: Center(child: Helper2Text("정보 조회", kDarkBlue)),
            ),
          ),
        )
      ],
    ),
  );
}