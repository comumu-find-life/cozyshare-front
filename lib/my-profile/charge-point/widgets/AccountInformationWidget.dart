

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/ChargePointController.dart';

class AccountInformationWidget extends StatelessWidget {
  ChargePointController _controller;


  AccountInformationWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteBackGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100.h),
              child: Title2Text("아래 계좌로 입급해주시길 바랍니다.", kTextBlackColor),
            ),
          ),

          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100.h),
              child: Title2Text("국민은행 94160200712344.", kTextBlackColor),
            ),
          ),
          Center(
            child: Container(
                width: 170.w,
                height: 47.h,
                margin: EdgeInsets.only(top: 20.h, right: 10.w),
                //color: kBlueColor,
                child: Center(child: NumberText(_controller.priceController.text, kTextBlackColor, 14))
            ),
          ),
        ],
      ),
    );
  }
}
