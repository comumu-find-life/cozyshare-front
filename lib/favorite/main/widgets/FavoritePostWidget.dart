

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/FavoriteController.dart';

class FavoritePostWidget extends StatelessWidget {
  FavoriteController _controller;


  FavoritePostWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 15.h,
          ),
          _buildPost(),
          _buildPost(),
          _buildPost(),
        ],
      ),
    );
  }

  Widget _buildPost() {
    return Container(
      margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 7.w),
            width: 120.w,
            height: 110.h,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/images/test/home.png", fit: BoxFit.cover,)
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 200.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Body1Text("경기도 안산시 오목로 11길 5", kTextBlackColor),
                    ),
                    Container(
                      child: Icon(Icons.favorite, size: 15.sp, color: Colors.red,),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                child: Body2Text("방3 화장실1", kGrey500Color),
              ),
              Container(
                margin: EdgeInsets.only(top: 3.h),
                child: Body2Text("월세", kGrey600Color),
              )
            ],
          )
        ],
      ),
    );
  }
}
