
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class ProviderListWidget extends StatelessWidget {
  const ProviderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 380.w,
      height: 220.h,
      color: kWhiteBackGroundColor,
      child: Column(
        children: [
          _myPostItem(),
          _registerMyHomeItem(),
          _registerMyJobItem(),
        ],
      ),
    );
  }

  Widget _myPostItem( ) {
    return Container(
      width: 380.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 10.w, top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(

                child: Icon(Icons.bookmark_border, color: kGrey600Color, size: 20.sp,),
              ),
              Container(
                margin: EdgeInsets.only(left: 7.w),
                child: Body2Text("내 게시글 관리", kTextBlackColor),
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(right: 15.w, top: 15.h),
            child: Icon(Icons.arrow_forward_ios_outlined, size: 19.sp,),)
        ],
      ),
    );
  }

  Widget _registerMyHomeItem( ) {
    return Container(
      width: 380.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 10.w, top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(

                child: Icon(Icons.home_filled, color: kGrey600Color, size: 20.sp,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Body2Text("내 집 내놓기", kTextBlackColor),
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(right: 15.w, top: 15.h),
            child: Icon(Icons.arrow_forward_ios_outlined, size: 19.sp,),)
        ],
      ),
    );
  }

  Widget _registerMyJobItem( ) {
    return Container(
      width: 380.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 10.w, top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(

                child: Icon(Icons.work, color: kGrey600Color, size: 20.sp,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Body2Text("직원 구인하기", kTextBlackColor),
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(right: 15.w, top: 15.h),
            child: Icon(Icons.arrow_forward_ios_outlined, size: 19.sp,),)
        ],
      ),
    );
  }
}
