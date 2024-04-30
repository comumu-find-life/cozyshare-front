
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/RegisterHomeController.dart';


class RegisterAddressWidget extends StatelessWidget {

  RegisterHomeController _controller;

  RegisterAddressWidget(this._controller);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20.h),
      width: 320.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Title2Text("Address", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 10.h),
            width: 320.w,
            height: 35.h,
            decoration: BoxDecoration(
              border: Border.all(color: kGrey300Color),
              borderRadius: BorderRadius.all(Radius.circular(6))

            ),
          ),
        ],
      ),
    );
  }
}
