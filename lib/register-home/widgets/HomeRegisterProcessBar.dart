import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants/Fonts.dart';




AppBar HomeRegisterAppBar(BuildContext context, double value){
  return  AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: kWhiteBackGroundColor,
    automaticallyImplyLeading: false,
    title: Container(
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
                width: 11.w, height: 19.h, child: Icon(Icons.arrow_back_ios)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 10.w),
            child: new LinearPercentIndicator(
              width: 320.w,
              animation: false,
              barRadius: Radius.circular(20),
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: value,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: kBlueColor,
            ),
          )
        ],
      ),
    ),
  );
}