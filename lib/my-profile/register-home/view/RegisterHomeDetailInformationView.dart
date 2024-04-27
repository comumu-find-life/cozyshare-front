import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/button/ButtonWidgets.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/register-home/view/RegisterHomeIntroduceView.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../constants/Colors.dart';
import '../controller/RegisterHomeController.dart';

class RegisterHomeDetailInformationView extends StatelessWidget {
  RegisterHomeController _controller;

  RegisterHomeDetailInformationView(this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        title: "",
        canBack: true,
      ),
      body: SingleChildScrollView(
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.h, left: 20.w),
                    child:
                        Title2Text("집 상세 정보", kTextBlackColor),
                  ),
                  buildInputHomeType(),
                  Row(
                    children: [
                      _buildInputBond(),
                      _buildInputBill(),
                    ],
                  ),

                  _buildInputBedRoomCount(),
                  _buildInputBathRoomCount(),
                  _buildButton()
                ],
              ))),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 290.h),
      child: Center(child: InkWell(
          onTap: (){
            Get.to(() => RegisterHomeIntroduceView(_controller));
          },
          child: NextButtonWidget("Next"))),
    );
  }

  Widget buildInputHomeType() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _controller.selectHomeType(1);
            },
            child: _controller.isRentType
                ? Container(
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("렌트", kWhiteBackGroundColor),
              ),
            )
                : Container(
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGrey400Color),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("렌트", kGrey600Color),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _controller.selectHomeType(2);
            },
            child: _controller.isShareRoomType
                ? Container(
              margin: EdgeInsets.only(left: 8.w),
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("쉐어", kWhiteBackGroundColor),
              ),
            )
                : Container(
              margin: EdgeInsets.only(left: 8.w),
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGrey400Color),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("쉐어", kGrey600Color),
              ),
            ),
          )
        ],
      ),
    );
  }

  //보증금
  Widget _buildInputBond() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w, top: 15.h),
            child: Icon(Icons.monetization_on_rounded),
          ),
          Container(
            width: 130.w,
            height: 47.h,
            decoration: BoxDecoration(
                border: Border.all(color: kGrey200Color),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            margin: EdgeInsets.only(top: 20.h, left: 9.w),
            child: TextFormField(
              onChanged: (text) {},
              controller: _controller.depositController,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.left,

              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
                hintText: "보증금",
                hintStyle: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade500,
                    fontFamily: "hint"),
                border: InputBorder.none,
                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
              ),
            ),
          ),
        ],
      ),
    );
  }

  //지불 비용
  Widget _buildInputBill() {
    return Container(

      width: 140.w,
      height: 47.h,
      decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.only(top: 40.h, left: 9.w),
      child: TextFormField(
        onChanged: (text) {},
        controller: _controller.depositController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "주세",
          hintStyle: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade500,
              fontFamily: "hint"),
          border: InputBorder.none,
          isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
        ),
      ),
    );
  }

  //방 개수
  Widget _buildInputBedRoomCount() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 15.h),
          child: Icon(Icons.bed),
        ),
        Container(
          width: 280.w,
          height: 47.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(top: 20.h, left: 9.w),
          child: TextFormField(
            onChanged: (text) {},
            controller: _controller.bedRoomCountController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "방 개수",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  fontFamily: "hint"),
              border: InputBorder.none,
              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
            ),
          ),
        ),
      ],
    );
  }

  //화장실 개수
  Widget _buildInputBathRoomCount() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 15.h),
          child: Icon(Icons.bathtub_rounded),
        ),
        Container(
          width: 280.w,
          height: 47.h,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(top: 20.h, left: 9.w),
          child: TextFormField(
            onChanged: (text) {},
            controller: _controller.depositController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "화장실 개수",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade500,
                  fontFamily: "hint"),
              border: InputBorder.none,
              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
            ),
          ),
        ),
      ],
    );
  }
}
