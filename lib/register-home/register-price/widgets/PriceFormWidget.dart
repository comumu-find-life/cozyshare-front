import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../controller/HomePriceController.dart';

class PriceFormWidget extends StatelessWidget {
  HomePriceController _controller;

  PriceFormWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInputBond(),
        _buildInputRent(),
        _buildInputBill(),
      ],
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
}
