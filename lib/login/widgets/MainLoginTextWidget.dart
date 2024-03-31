

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../../constants/Fonts.dart';

Widget MainLoginTextWidget(){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 100.h),
        child: LargeTitleText("Home And Job", kGrey700Color),
      )
    ],
  );
}