
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../model/home/response/HomeInformationResponse.dart';

Widget HomeInformationByDealWidget( String homeImage, String address, int rent, int bond) {
  return Container(
    color: kWhiteBackGroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 15.h),
          child: Title2Text("Transaction room information", kTextBlackColor),
        ),
        InkWell(
          onTap: (){
            // Get.to(() => RoomDetailView(homeId!, true));
          },
          child: Center(
            child: Container(
              width: 350.w,
              height: 160.h,
              decoration: BoxDecoration(
                  color: kWhiteBackGroundColor,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: kGrey200Color)
              ),
              margin: EdgeInsets.only(top: 15.h, left: 0.w),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 0.w),
                      width: 105.w,
                      height: 160.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft : Radius.circular(6), bottomLeft: Radius.circular(6)),
                        child: Image.asset(
                          "assets/images/test/home.png",
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 10.w,top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 230.w,
                          margin: EdgeInsets.only(top: 3.h, right: 1.w),
                          child: FBoldText(
                              "${address}", kTextBlackColor, 13),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: SubTitle2Text("Bond :  ${bond} \$", kTextBlackColor),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: SubTitle2Text("Rent Fee:  ${rent} \$", kTextBlackColor),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}