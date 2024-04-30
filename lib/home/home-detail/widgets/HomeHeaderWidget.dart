

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/home/home-map/view/GetterMapView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300.w,
                margin: EdgeInsets.only(top: 10.h),
                child: Title2Text("23 prospect road summer hill", kTextBlackColor),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => HomeMapView());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Icon(Icons.location_pin, color: kDarkBlue,size: 30.sp,),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Title2Text("보증금 1000 \$", kTextBlackColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Title2Text("주 200 \$", kTextBlackColor),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.w,top: 5.h),
                  width: 130.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: kDarkBlue
                  ),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(Icons.verified_user,color: kWhiteBackGroundColor,),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10.w, left: 5.w),
                          child: Body2Text("안전거래", kWhiteBackGroundColor)),
                    ],
                  )),
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.h,right: 10.w),
            width: 380.w,
            height: 1.h,
            color: kGrey200Color,
          ),

          Container(
            width: 330.w,
            margin: EdgeInsets.only(top: 15.h),
            child: Body2Text("4월 28일부터 이사 가능합니다. \n\n 올워스 5분거리 IGA 1분거리 있습니다. \n\n최소 한달 이상 계약이고, 3배드 2바쓰입니다. 파티룸이 아닌 조용하고 편안한 휴식을 취하실 분들을 위한 집입니다.", kTextBlackColor),
          ),
        ],
      ),
    );
  }
}
