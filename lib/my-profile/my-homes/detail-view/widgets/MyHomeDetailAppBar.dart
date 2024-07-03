

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';

AppBar MyHomeDetailAppBar(BuildContext context){
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: kWhiteBackGroundColor,
    automaticallyImplyLeading: false,
    title:  Container(
      width: 360.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              //여기에 코드 구현

              Navigator.pop(context);
            },
            child: Container(
                width: 11.w,
                height: 19.h,
                child: Icon(Icons.arrow_back_ios)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 150.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: kPrimaryColor
            ),
            child: Center(
              child: Body2Text("Change State", kWhiteBackGroundColor),
            ),
          ),
        ],
      ),
    ),
  );
}