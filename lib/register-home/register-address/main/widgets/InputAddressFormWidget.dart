import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../controller/HomeAddressController.dart';

class AddressFormWidget extends StatelessWidget {
  HomeAddressController _controller;

  AddressFormWidget(this._controller);

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputCity(context),
        _buildInputStreetName(),
        Row(
          children: [_buildInputStreetCode(), _buildInputPostCode()],
        ),
        _buildInputDetailAddress()
      ],
    );
  }

  Widget _buildInputCity(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            _controller.searchCity(context);
          },
          child: Container(
              width: 320.w,
              height: 47.h,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: _controller.cityAndState == ""
                          ? kGrey200Color
                          : kDarkBlue),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              margin: EdgeInsets.only(top: 20.h, left: 20.w),
              child: Container(
                margin: EdgeInsets.only(top: 0.h, left: 10.w),
                child: _controller.cityAndState != ""
                    ? Container(
                        child: Container(
                          margin: EdgeInsets.only(left: 5.w, top: 10.h),
                          child: Text(
                            "${_controller.cityAndState}",
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: kDarkBlue,
                                fontFamily: "hint"),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Container(
                            child: Icon(Icons.search),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.w),
                            child: Text(
                              "Search City",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey.shade500,
                                  fontFamily: "hint"),
                            ),
                          )
                        ],
                      ),
              )),
        ));
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
        onChanged: (text) {
          _controller.validateAllInput();
        },
        controller: _controller.detailAddressController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Detail Address",
          hintStyle: TextStyle(
              fontSize: 13.sp, color: Colors.grey.shade500, fontFamily: "hint"),
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
        onChanged: (text) {
          _controller.validateAllInput();
        },
        controller: _controller.streetNameController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Street Name ",
          hintStyle: TextStyle(
              fontSize: 13.sp, color: Colors.grey.shade500, fontFamily: "hint"),
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
          keyboardType: TextInputType.number,


    onChanged: (text) {
          _controller.validateAllInput();
        },
        controller: _controller.streetCodeController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Street Code",
          hintStyle: TextStyle(
              fontSize: 13.sp, color: Colors.grey.shade500, fontFamily: "hint"),
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
        keyboardType: TextInputType.number,
        onChanged: (text) {
          _controller.validateAllInput();
        },
        controller: _controller.postCodeController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "Post Code",
          hintStyle: TextStyle(
              fontSize: 13.sp, color: Colors.grey.shade500, fontFamily: "hint"),
          border: InputBorder.none,
          isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
        ),
      ),
    );
  }
}
