import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/home/home-detail/controller/HomeDetailController.dart';
import 'package:home_and_job/home/home-detail/widgets/HomeDetailBottomBar.dart';

class HomeDetailView extends StatelessWidget {
  const HomeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeDetailController _controller = HomeDetailController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        canBack: true,
        title: "",
      ),
      bottomNavigationBar: HomeDetailBottomBar(_controller),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHomeImages(),
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

  Widget _buildHomeImages() {
    return Container(
      height: 200.0,
      child: PageView(
        children: [
          Image.asset(
            "assets/images/test/home.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/test/home1.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/test/home2.png",
            fit: BoxFit.cover,
          ),

          // 여러 개의 이미지를 추가할 수 있습니다.
        ],
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200.w,
                margin: EdgeInsets.only(top: 10.h),
                child: Body2Text("23 prospect road summer hill", kTextBlackColor),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.w),
                width: 130.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: kBlueColor
                ),
                child: Center(child: Body2Text("안전거래 가능 매물", kWhiteBackGroundColor)),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Title2Text("보증금 1000 \$", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Title2Text("주 200 \$", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.h,right: 10.w),
            width: 380.w,
            height: 1.h,
            color: kGrey200Color,
          ),

          Container(
            width: 330.w,
            margin: EdgeInsets.only(top: 15.h),
            child: Body2Text("4월 28일부터 이사 가능합니다. \n\n 올워스 5분거리 IGA 1분거리 있습니다. \n\n최소 한달 이상 계약이고, 3배드 2바쓰입니다. 파티룸이 아닌 조용하고 편안한 휴식을 취하실 분들을 위한 집입니다.", kTextBlackColor),
          ),
        ],
      ),
    );
  }
}
