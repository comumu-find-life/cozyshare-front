import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../constants/InformationTextConstants.dart';

class ProctedDealGuide extends StatelessWidget {
  const ProctedDealGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        color: kWhiteBackGroundColor,
        title: "",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            _buildBody1(),
            _buildBody2(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody2(){
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Title2Text("조심해야 하는 보증금 사기", Colors.red),
          ),
          Container(
            margin: EdgeInsets.only(top: 25.h),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.fiber_manual_record),
                ),
                Container(
                  child: Body2Text("보증금을 먼저 송금하는 것 보단", kGrey600Color),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 330.w,
              height: 340.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/guide/trap_money.png",
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildBody1() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 60.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Title2Text("걱정없는 보증금 송금", kBlueColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.looks_one),
                ),
                Container(
                  child: Body2Text("세입자가 보증금/계약금을 송금", kGrey600Color),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.looks_two),
                ),
                Container(
                  child: Body2Text("돈을 Find Life 에서 보호합니다.", kGrey600Color),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.looks_3),
                ),
                Container(
                  child: Body2Text("계약이 성사되면 집 주인게에 보증금이 송급됩니다.", kGrey600Color),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
              width: 330.w,
              height: 340.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/guide/protected_money.png",
                  fit: BoxFit.cover,
                ),
              )),

        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            width: 70.w,
            height: 70.h,
            child: Image.asset("assets/icons/deal_icon.png"),
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 240.w,
                  child: Title2Text("사기 걱정없는 거래", kTextBlackColor)),
              Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 240.w,
                  child: Title1Text("Find Life", kBlueColor)),
            ],
          )
        ],
      ),
    );
  }
}
