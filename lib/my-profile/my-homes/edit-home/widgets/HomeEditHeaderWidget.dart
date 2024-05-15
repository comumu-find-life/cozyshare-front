import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';


class HomeEditHeaderWidget extends StatelessWidget {
  const HomeEditHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: FBoldText("\$ 2000/150", kTextBlackColor, 17),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: FRegularText("weekly rent", kTextBlackColor, 17),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300.w,
                margin: EdgeInsets.only(top: 15.h),
                child: FBoldText(
                    "23 prospect road summer hill", kTextBlackColor, 15),
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Icon(
                    Icons.edit,
                    color: kDarkBlue,
                    size: 30.sp,
                  ),
                ),
              )
            ],
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 20.h),
          //   width: 100.w,
          //   height: 40.h,
          //   decoration: BoxDecoration(
          //       border: Border.all(color: kGrey300Color),
          //       borderRadius: BorderRadius.all(Radius.circular(6))),
          //   child: Center(child: Body2Text("\$2000 / 150", kGrey600Color)),
          // )
        ],
      ),
    );
  }
}
