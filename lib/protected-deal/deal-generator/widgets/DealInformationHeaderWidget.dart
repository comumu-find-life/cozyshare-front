
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../model/home/response/HomeInformationResponse.dart';

Widget DealInformationHeaderWidget(HomeInformationResponse homeInformationResponse) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.w, top: 15.h),
        child: Title2Text("거래 매물", kTextBlackColor),
      ),
      InkWell(
        onTap: (){
          Get.to(() => RoomDetailView(homeInformationResponse.homeId!, true));
        },
        child: Center(
          child: Container(
            width: 350.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: kGrey100Color,
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
                        width: 240.w,
                        margin: EdgeInsets.only(top: 3.h),
                        child: Helper2Text(
                            "${homeInformationResponse.address}", kTextBlackColor),
                      )
                      // Container(
                      //   child: SubTitle2Text("${homeInformationResponse.bond} \$", kTextBlackColor),
                      // ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}