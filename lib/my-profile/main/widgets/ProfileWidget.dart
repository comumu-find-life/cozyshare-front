

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/main/controller/MyProfileController.dart';

class ProfileWidget extends StatelessWidget {

  MyProfileController _controller;


  ProfileWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(

      color: kWhiteBackGroundColor,

      width: 380.w,
      height: 160.h,
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileImage(),
          Container(
              margin: EdgeInsets.only(left: 7.w),
              child: _buildInformation()),
        ],
      ),
    ));
  }

  Widget _buildInformation() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _controller.isProvider? Container(
          margin: EdgeInsets.only(top: 15.h),
          width: 80.w,
          height: 27.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: kBlueColor
          ),

          child: Center(child: HelperText("제공자 모드", kWhiteBackGroundColor)),

        ): Container(
          margin: EdgeInsets.only(top: 15.h),
          width: 50.w,
          height: 27.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: kBlueColor
          ),

          child: Center(child: HelperText("일반 모드", kWhiteBackGroundColor)),

        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Body2Text("신민석", kTextBlackColor),
        ),

        InkWell(
          onTap: (){
            _controller.changeRole();
          },
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(color: kGrey400Color),
              borderRadius: BorderRadius.all(Radius.circular(7))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.swap_horiz, size: 18.sp,),
                _controller.isProvider?Container(child: Body2Text("provider 변환", kGrey700Color),):Container(child: Body2Text("getter 변환", kGrey700Color),)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: kGrey200Color,
        shape: BoxShape.circle
      ),
    );
  }
}
