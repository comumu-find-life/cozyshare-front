


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

Widget GetterDealFinishWidget(){
  return Container(
    width: 220.w,
    height: 280.h,
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
            child: Title3Text("거래가 성사 됐어요!", kDarkBlue)),
        Container(
          margin: EdgeInsets.only(top: 3.h, left: 13.w),
          child: Helper2Text("\n안전하게 거래가 성사됐어요!\n\n계약금/보증금은 집 주인에게 안전하게 잘 전송됐습니다.\n\n안전거래를 이용해 주셔서 감사합니다.", kGrey600Color),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 40.h),
            width: 200.w,
            height: 35.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: kLightBlue),
            child: Center(child: Helper2Text("거래 내역", kDarkBlue)),
          ),
        )
      ],
    ),
  );
}