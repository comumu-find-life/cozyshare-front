import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealResponse.dart';

/**
 * step 1 : 입금 확인 중
 * step 2: 입금 확인
 * step 3: 거래 완료
 */
Widget DealProcessWidget(int step) {

  return Center(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildProcessBarCircle(step),
          _buildProcessText(step),
        ],
      ),
    ),
  );
}

Widget _buildProcessText(int step) {
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 315.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Body2Text("입금 확인 중", kDarkBlue),
        ),
        Container(
          child: Body2Text("입금 확인", step >= 2 ? kDarkBlue : kGrey400Color),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.w),
          child: Body2Text("거래 완료", step >= 3 ? kDarkBlue : kGrey400Color),
        ),
      ],
    ),
  );
}

Widget _buildProcessBarCircle(int step) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(shape: BoxShape.circle, color: kDarkBlue),
          ),
          _buildLine(step >= 2 ? true : false)
        ],
      ),
      Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: step >= 2 ? kDarkBlue : kGrey400Color),
          ),
          _buildLine(step >= 3 ? true : false)
        ],
      ),
      Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: step >= 3 ? kDarkBlue : kGrey400Color),
          ),
        ],
      ),
    ],
  );
}

Widget _buildLine(bool state) {
  return Container(
    width: 100.w,
    height: 1.5.h,
    color: state ? kDarkBlue : kGrey300Color,
  );
}
