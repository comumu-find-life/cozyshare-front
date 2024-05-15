import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class ProfileDetailBody extends StatelessWidget {
  const ProfileDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      color: kWhiteBackGroundColor,
      margin: EdgeInsets.only(left: 0.w, top: 180.h),
      child: Container(
        margin: EdgeInsets.only(left: 20.w, top: 100.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNationality(),

            _buildGender(),
            _buildJob(),
            _buildSns(),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 20.w),
                width: 340.w,
                height: 1.h,
                color: kGrey300Color,
              ),
            ),
            _buildAboutMe(),
          ],
        ),
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
            child: FRegularText("Korean", kTextBlackColor, 14),
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
            child: FRegularText("Male", kTextBlackColor, 14),
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
            child: FRegularText("Student", kTextBlackColor, 14),
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
          margin: EdgeInsets.only(top: 20.h),
          child: FBoldText("Introduce Myself", kTextBlackColor, 15),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
          width: 340.w,
          height: 250.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey300Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Container(
              margin: EdgeInsets.all(10),
              child: FRegularText(
                  "Introduce Myself My job is student\n Introduce Myself My job is studentIntroduce Myself My job is studentIntroduce Myself My job is studentIntroduce Myself My job is studentIntroduce Myself My job is studentIntroduce Myself My job is studentIntroduce Myself My job is studentIntroduce Myself My job is studentIntroduce Myself My job is student",
                  kTextBlackColor,
                  14)),
        )
      ],
    );
  }
}
