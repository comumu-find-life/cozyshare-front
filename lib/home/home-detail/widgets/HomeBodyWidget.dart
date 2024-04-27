
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.w, top: 20.h),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.crop),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: SubTitle1Text("면적  20평", kTextBlackColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, top: 20.h),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.shower),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: SubTitle1Text("화장실 개수  1개", kTextBlackColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, top: 20.h),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.local_parking),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: SubTitle1Text("주차 가능", kTextBlackColor),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
