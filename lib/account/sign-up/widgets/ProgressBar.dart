import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../controller/SignupController.dart';

class ProgressBar extends StatelessWidget {
  SignupController _controller;

  ProgressBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      margin: EdgeInsets.only(top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100.w,
            height: 8.h,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            width: 100.w,
            height: 8.h,
            decoration: BoxDecoration(
                color: _controller.step >= 2 ? kPrimaryColor : kGrey200Color,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            width: 100.w,
            height: 8.h,
            decoration: BoxDecoration(
                color: _controller.step >= 3 ? kPrimaryColor : kGrey200Color,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ],
      ),
    );
  }
}
