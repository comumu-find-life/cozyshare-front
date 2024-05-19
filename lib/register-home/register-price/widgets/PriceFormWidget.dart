import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

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
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: FBoldText("\$", kGrey700Color, 14),
                ),
                Container(
                  width: 270.w,
                  height: 45.h,
                  margin: EdgeInsets.only(top: 3.h),
                  child: TextFormField(
                    keyboardType: TextInputType.number,

                    onChanged: (text) {
                      _controller.validateAllInput();
                    },
                    controller: _controller.bondController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,

                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
                      hintText: "Bond",
                      hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: kGrey600Color,
                          fontFamily: "hint"),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              ],
            )
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
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: FBoldText("\$", kGrey700Color, 14),
                ),
                Container(
                  width: 270.w,
                  height: 45.h,
                  margin: EdgeInsets.only(top: 3.h),
                  child: TextFormField(
                    keyboardType: TextInputType.number,

                    onChanged: (text) {
                      _controller.validateAllInput();
                    },
                    controller: _controller.rentController,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,

                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
                      hintText: "Rent (per week)",
                      hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: kGrey600Color,
                          fontFamily: "hint"),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                ),
              ],
            )
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
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: FBoldText("\$", kGrey700Color, 14),
              ),
              Container(
                width: 270.w,
                height: 45.h,
                margin: EdgeInsets.only(top: 3.h),
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  onChanged: (text) {
                    _controller.validateAllInput();
                  },
                  controller: _controller.bill,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left,

                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
                    hintText: "Bill",
                    hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: kGrey600Color,
                        fontFamily: "hint"),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}
