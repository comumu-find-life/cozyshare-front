

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class DepositGuideWidget extends StatelessWidget {
  const DepositGuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 18.w,top: 40.h),
          child: Title2Text("안전 거래 과정", kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 18.w,top: 20.h),
          child: Row(
            children: [
              Container(
                child: Icon(Icons.looks_one_outlined, size: 19.sp, color: kDarkBlue,),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: Body2Text("아래 입금 계좌로 계약금/보증금 을 송금합니다.", kGrey700Color),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 18.w,top: 18.h),
          child: Row(
            children: [
              Container(
                child: Icon(Icons.looks_two_outlined, size: 19.sp, color: kDarkBlue,),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),
                child: Body2Text("입금이 확인되면 '거래 확정' 버튼을 누를 수 있습니다.", kGrey700Color),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 18.w,top: 18.h),
          child: Row(
            children: [
              Container(
                child: Icon(Icons.looks_3_outlined, size: 19.sp, color: kDarkBlue,),
              ),

              Container(
                width: 300.w,
                margin: EdgeInsets.only(left: 5.w),
                child: Body2Text("이용약관을 동의 후 '거래 확정' 버튼을 누르면 계악금/보증금 이 집 주인에게 전달됩니다.", kGrey700Color),
              )
            ],
          ),
        ),
      ],
    );
  }
}
