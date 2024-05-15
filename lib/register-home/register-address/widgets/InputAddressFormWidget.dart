
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../register-price/view/RegisterHomePriceView.dart';
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
        controller: _controller.cityController,
        style: TextStyle(color: Colors.black),
        // 텍스트 색상을 검정색으로 설정
        textAlign: TextAlign.left,

        // 텍스트를 왼쪽으로 정렬
        cursorColor: kTextBlackColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
          hintText: "City Name",
          hintStyle: TextStyle(
              fontSize: 13.sp, color: Colors.grey.shade500, fontFamily: "hint"),
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
        onChanged: (text) {},
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
              fontSize: 13.sp, color: Colors.grey.shade500, fontFamily: "hint"),
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
          border: Border.all(color: kGrey300Color)),
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
