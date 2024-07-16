import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/room/room-detail/controller/HomeDetailController.dart';

/**
 * (1) 주차 가능 여부
 * (2) Women only
 * (3) Shared bathroom (공용 화장실) , (개인 화장실)
 * (4) 관리비
 */
Widget HomeOverViewWidget(HomeDetailController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 40.h,left: 20.w),
        width: 340.w,
        decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Center(
          child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 10.w, top: 15.h, bottom: 15.h),
              child: Body2Text(controller.homeInformationResponse!.introduce!, kGrey700Color)),
        ),
      ),
    ],
  );
}

