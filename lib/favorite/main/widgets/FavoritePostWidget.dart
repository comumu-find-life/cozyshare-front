

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
    return InkWell(
      onTap: (){
        _controller.moveHomePost();
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w),
        decoration: BoxDecoration(
          color: kWhiteBackGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 1.5,
                spreadRadius: 1.3,
                offset: const Offset(0, 1),
              )
            ]
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 7.w),
              width: 120.w,
              height: 120.h,
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
                        child: Title3Text("WAS 멜버른 postcode", kTextBlackColor),
                      ),
                      Container(
                        child: Icon(Icons.favorite, size: 15.sp, color: Colors.red,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Body2Text("2000\$ / 150\$", kGrey500Color),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.w,top: 10.h),
                  width: 110.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: kDarkBlue
                  ),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(Icons.verified_user,color: kWhiteBackGroundColor, size: 17.sp,),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10.w, left: 5.w),
                          child: Body2Text("안전거래", kWhiteBackGroundColor)),
                    ],
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
