import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/main/main/controller/MainController.dart';

class HotPostWidget extends StatelessWidget {
  MainController controller;

  HotPostWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            _buildText(),
            _buildSelectType(),
            controller.selectHome? _buildHotHomePost() : _buildHotJobPost()
          ],
        ));
  }

  Widget _buildHotHomePost() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w, bottom: 30.h),
      width: 340.w,
      height: 200.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _homeWidget(),
            _homeWidget(),
            _homeWidget(),
            _homeWidget(),

          ],
        ),
      ),
    );
  }

  Widget _buildHotJobPost() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w, bottom: 30.h),
      width: 340.w,
      height: 200.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _jobWidget(),
            _jobWidget(),

          ],
        ),
      ),
    );
  }

  Widget _homeWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 7.w),
            width: 120.w,
            height: 80.h,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/images/test/home.png", fit: BoxFit.cover,)
            ),
          ),
          Container(
            width: 120.h,
            height: 40.h,
            margin: EdgeInsets.only(top: 5.h),
            child: Body2Text("호주 멜버른에 위치한 제일 좋은 집", kTextBlackColor),
          )
        ],
      ),
    );
  }

  Widget _jobWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 7.w),
            width: 120.w,
            height: 80.h,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/images/test/home.png", fit: BoxFit.cover,)
            ),
          ),
          Container(
            width: 120.h,
            height: 40.h,
            margin: EdgeInsets.only(top: 5.h),
            child: Body2Text("호주 멜버른에 위치한 제일 좋은 집", kTextBlackColor),
          )
        ],
      ),
    );
  }

  Widget _buildSelectType() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 15.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              controller.selectHotPost(1);
            },
            child: Container(
              width: 60.w,
              height: 40.h,
              decoration: controller.selectHome
                  ? BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: kTextBlackColor,
                      border: Border.all(color: kGrey300Color))
                  : BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: kWhiteBackGroundColor,
                      border: Border.all(color: kGrey300Color)),
              child: Center(
                child: Body2Text("렌트",controller.selectHome? kWhiteBackGroundColor : kGrey700Color),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.selectHotPost(2);
            },
            child: Container(
              margin: EdgeInsets.only(left: 5.w),
              width: 90.w,
              height: 40.h,
              decoration: controller.selectJob
                  ? BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: kTextBlackColor,
                  border: Border.all(color: kGrey300Color))
                  : BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: kWhiteBackGroundColor,
                  border: Border.all(color: kGrey300Color)),
              child: Center(
                child: Body2Text("쉐어 하우스", controller.selectJob? kWhiteBackGroundColor : kGrey700Color),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildText() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w),
      child: Row(
        children: [
          Container(
            child: Title2Text("인기 게시글", kTextBlackColor),
          ),
          Container(
            margin: EdgeInsets.only(left: 7.w),
            width: 50.w,
            height: 25.h,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(color: Colors.red)),
            child: Center(
              child: Body2Text("HOT", kWhiteBackGroundColor),
            ),
          )
        ],
      ),
    );
  }
}
