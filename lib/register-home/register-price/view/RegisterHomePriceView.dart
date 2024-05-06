import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/button/ButtonWidgets.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/register-home/register-details/view/RegisterHomeDetailsView.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';
import '../../controller/RegisterHomeController.dart';

import '../../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../../constants/Colors.dart';
import '../../controller/RegisterHomeController.dart';
import '../../register-introduce/view/RegisterHomeIntroduceView.dart';

class RegisterHomePriceView extends StatelessWidget {
  RegisterHomeController _controller;

  RegisterHomePriceView(this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: _buildButton(),
        backgroundColor: kWhiteBackGroundColor,
        appBar: CommonAppBar(
          color: kWhiteBackGroundColor,
          title: "",
          canBack: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeRegisterProcessBar(0.6),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 20.h),
              child: Title3Text("Room Price", kTextBlackColor),
            ),
            Column(
              children: [
                _buildInputBond(),
                _buildInputRent(),
                _buildInputBill(),
              ],
            ),
          ],
        )));
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() => _controller.isRegisterImage
          ? InkWell(
              onTap: () {
                Get.to(() => RegisterHomeDetailsView(_controller), transition: Transition.noTransition);
              },
              child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }

  //보증금
  Widget _buildInputBond() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(

          width: 320.w,
          height: 47.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(top: 10.h, left: 20.w),
          child: TextFormField(
            onChanged: (text) {},
            controller: _controller.bondController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "\$ Bond",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  fontFamily: "hint"),
              border: InputBorder.none,
              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
            ),
          ),
        )
      ],
    );
  }

  //지불 비용
  Widget _buildInputRent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(

          width: 320.w,
          height: 47.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(top: 10.h, left: 20.w),
          child: TextFormField(
            onChanged: (text) {},
            controller: _controller.rentController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "\$ Weekly rent",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  fontFamily: "hint"),
              border: InputBorder.none,
              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
            ),
          ),
        )
      ],
    );
  }

  //지불 비용
  Widget _buildInputBill() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(

          width: 320.w,
          height: 47.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(top: 10.h, left: 20.w),
          child: TextFormField(
            onChanged: (text) {},
            controller: _controller.rentController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "\$ Bill",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  fontFamily: "hint"),
              border: InputBorder.none,
              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
            ),
          ),
        )
      ],
    );
  }

//방 개수

//화장실 개수
}
