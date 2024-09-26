
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../constants/Colors.dart';
import '../controller/MyPointController.dart';

class MyPointHistory extends StatelessWidget {
  MyPointController _controller;


  MyPointHistory(this._controller);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 13.w, top: 50.h),
                  child: FBoldText("History", kTextBlackColor, 14))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 350.w,
            height: 320.h,
            decoration: BoxDecoration(
                color: kGrey100Color,
                borderRadius: BorderRadius.all(Radius.circular(6))

            ),
          ),
        ],
      )
    );
  }
}
