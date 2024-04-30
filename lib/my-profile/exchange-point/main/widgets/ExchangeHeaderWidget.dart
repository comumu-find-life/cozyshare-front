
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';

Widget ExchangeHeaderWidget(){
  return Column(
    children: [
      Center(
        child: Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Title3Text("출금 가능 포인트", kGrey500Color),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 13.h),
        child: NumberText("300\$", kGrey700Color, 18),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 380.w,
        height: 30.h,
        color: kGrey100Color,
        child: Center(
          child: HelperText("출금 정보 : 국민은행 941602****** (신민석)", kGrey500Color),
        ),
      )
    ],
  );
}