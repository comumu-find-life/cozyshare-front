import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class HomeDetailView extends StatelessWidget {
  const HomeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        canBack: true,
        title: "",
      ),
      bottomNavigationBar: BottomAppBar(
        height: 90.h,
        color: kWhiteBackGroundColor,
        child: Center(
          child: Container(
            width: 330.w,
            height: 55.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: kBlueColor
            ),

            child: Center(child: ButtonText("문의하기", kWhiteBackGroundColor)),

          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset("assets/images/test/home.png"),
            ),
            _buildMainText(),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              width: 380.w,
              height: 1.h,
              color: kGrey200Color,
            ),
            _buildListItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem() {
    return Column(
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
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 20.h),
          child: Row(
            children: [
              Container(
                child: Icon(Icons.crop),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: SubTitle1Text("면적 :  20평", kTextBlackColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Body2Text("인천시 남동구 구월동", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Title1Text("월세 20/ 22", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Body1Text("관리비 없음", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Body1Text("집 한줄 소개.....", kTextBlackColor),
          ),
        ],
      ),
    );
  }
}
