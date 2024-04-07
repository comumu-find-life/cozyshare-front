import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/register-home/controller/RegisterHomeController.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../common-widgets/button/ButtonWidgets.dart';
import '../../../constants/Colors.dart';
import 'RegisterHomeDetailInformationView.dart';

class RegisterHomeAddressView extends StatelessWidget {
  RegisterHomeController _controller;

  RegisterHomeAddressView(this._controller);

  List<String> _states = [
    "ACT",
    "NSW",
    "NT",
    "QLD",
    "SA",
    "TAS",
    "VIC",
    "WA"
    // 여기에 더 많은 도시를 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        title: "",
        canBack: true,
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.h,left: 20.w),
                    child: Title2Text("Input Address", kTextBlackColor),
                  ),
                  Row(
                    children: [
                      _buildSelectState(),
                      _buildInputCity(),
                    ],
                  ),
                  _buildInputStreetName(),
                  Row(
                    children: [
                      _buildInputStreetCode(),
                      _buildInputPostCode()
                    ],
                  ),
                  _buildInputDetailAddress()
                ],
              ),
              _buildButton()
            ],

        ),
      ))
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 335.h),
      child: Obx(() => _controller.isAllInputAddress
          ? InkWell(
          onTap: () {
            Get.to(() => RegisterHomeDetailInformationView(_controller));
          },
          child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }

  Widget _buildInputCity() {
    return Container(

      width: 230.w,
      height: 47.h,

      decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
      child: TextFormField(
        onChanged: (text) {},
        controller: _controller.detailAddressController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "City Name ex) Melbourne",
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

  Widget _buildInputDetailAddress() {
    return Container(
      width: 320.w,
      height: 45.h,

      decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.only(top: 15.h, left: 20.w),
      child: TextFormField(
        onChanged: (text) {},
        controller: _controller.detailAddressController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Detail Address ex) 401호",
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

  Widget _buildInputStreetName() {
    return Container(
      width: 320.w,
      height: 45.h,

      decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.only(top: 15.h, left: 20.w),
      child: TextFormField(
        onChanged: (text) {},
        controller: _controller.streetNameController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Street Name ex)",
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

  Widget _buildInputStreetCode() {
    return Container(
      width: 150.w,
      height: 45.h,

      decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.only(top: 15.h, left: 20.w),
      child: TextFormField(
        onChanged: (text) {},
        controller: _controller.detailAddressController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Street Code",
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

  Widget _buildInputPostCode() {
    return Container(
      width: 150.w,
      height: 45.h,

      decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.only(top: 15.h, left: 20.w),
      child: TextFormField(
        onChanged: (text) {},
        controller: _controller.detailAddressController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Post Code",
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

  Widget _buildSelectState() {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: kGrey300Color)
      ),
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          underline: SizedBox(),
          value: _controller.selectedState,
          onChanged: (newValue) async {
            _controller.selectState(newValue!);
          },
          items: _states.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Body2Text(value, kTextBlackColor),
            );
          }).toList(),
        ),
      ),
    );
  }
}
