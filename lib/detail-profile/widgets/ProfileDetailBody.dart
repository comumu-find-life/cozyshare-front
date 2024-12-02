import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../model/user/response/UserProfileResponse.dart';

class ProfileDetailBody extends StatelessWidget {
  UserProfileResponse _userProfileResponse;


  ProfileDetailBody(this._userProfileResponse);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      color: kWhiteBackGroundColor,
      margin: EdgeInsets.only(left: 0.w, top: 0.h),
      child: Container(
        margin: EdgeInsets.only(left: 20.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildAboutMe(),
          ],
        ),
      ),
    );
  }

  Widget _buildLine() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 20.w),
        width: 340.w,
        height: 1.h,
        color: kGrey300Color,
      ),
    );
  }

  Widget _buildSns() {
    return Container(
      width: 330.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: FBoldText("SNS", kTextBlackColor, 14),
          ),
          Container(
            child: Row(
              children: [
                Container(

                  width: 25.w,
                  child: Image.asset("assets/icons/instagram_logo.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 25.w,
                  child: Image.asset("assets/icons/facebook_logo.png"),
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _buildNationality() {
    return Container(
      width: 330.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: FBoldText("Nationality", kTextBlackColor, 14),
          ),
          Container(
            child: FRegularText("${_userProfileResponse.nationality}", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }

  Widget _buildGender() {
    return Container(
      width: 330.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: FBoldText("Gender", kTextBlackColor, 14),
          ),
          Container(
            child: FRegularText("${_userProfileResponse.gender}", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }


  Widget _buildJob() {
    return Container(
      width: 330.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: FBoldText("Job", kTextBlackColor, 14),
          ),
          Container(
            child: FRegularText("${_userProfileResponse.job}", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }

  Widget _buildAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0.h),
          child: FBoldText("Introduce Myself", kTextBlackColor, 15),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
          width: 340.w,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey300Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Container(
              margin: EdgeInsets.all(10),
              child: FRegularText(
                  "${_userProfileResponse.introduce}",
                  kTextBlackColor,
                  14)),
        )
      ],
    );
  }
}
