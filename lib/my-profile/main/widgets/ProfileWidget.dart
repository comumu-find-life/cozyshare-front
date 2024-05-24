import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/main/controller/MyProfileController.dart';

import '../../../detail-profile/view/ProfileDetailView.dart';


class ProfileWidget extends StatelessWidget {
  MyProfileController _controller;

  ProfileWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteBackGroundColor,
      width: 380.w,

      height: 80.h,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileImage(),
                    _buildInformation(),
                  ],
                ),
                _buildButton(),
              ],
            ),
          ),
          //_buildPointInformation(),
        ],
      ),
    );
  }

  Widget _buildButton(){
    return Container(
      margin: EdgeInsets.only(top: 15.h,right: 20.w),
      width: 70.w,
      height: 35.h,
      decoration: BoxDecoration(
        //border: Border.all(color: kGrey400Color),
        color: kGrey100Color,
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: Center(child: FRegularText("프로필 보기", kTextBlackColor, 12)),
    );
  }

  Widget _buildPointInformation() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 310.w,
      height: 70.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: kGrey100Color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 50.w),
            child: Column(
              children: [
                Container(
                  child: Body2Text("0 \$", kTextBlackColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Body2Text("포인트", kGrey500Color),
                )
              ],
            ),
          ),
          Container(
            child: HintText("|", kGrey300Color),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, right: 50.w),
            child: Column(
              children: [
                Container(
                  child: Body2Text("0 장", kTextBlackColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Body2Text("쿠폰", kGrey600Color),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformation() {
    return Container(
      margin: EdgeInsets.only(top: 23.h, left: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: FBoldText("신민석", kTextBlackColor, 15),
              ),
            ],
          ),
          // InkWell(
          //   onTap: (){
          //     Get.to(() => ProfileDetailView());
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(top: 10.h),
          //     child: HintText2("프로필 추가 등록하기", kBlueColor),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 20.w),
      width: 45.w,
      height: 45.h,
      child: CircleAvatar(
        backgroundColor: kGrey200Color,
        backgroundImage: AssetImage("assets/images/test/man.png"),
      ),
    );
  }
}
