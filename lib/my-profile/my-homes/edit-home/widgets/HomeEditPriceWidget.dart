import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/HomeEditController.dart';

/**
 * (1) 주차 가능 여부
 * (2) Women only
 * (3) Shared bathroom (공용 화장실) , (개인 화장실)
 * (4) 관리비
 */

class HomeEditPriceWidget extends StatelessWidget {
  HomeEditController _controller;


  HomeEditPriceWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title2Text("Room Price", kTextBlackColor),
        ),
        _buildBond(),
        _buildDeposit(),
        _buildUtilityBill(),
      ],
    );
  }

  Widget _buildTotalPrice() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 40.h),
          width: 330.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: FBoldText("Price per month", kGrey800Color, 15),
              ),
              Container(
                child: NumberText("\$820 + a", kBlueColor, 14),
              ),
            ],
          ),
        ),

      ],
    );
  }

  Widget _buildBond() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      width: 330.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body1Text("Bond", kGrey800Color),
          ),
          Container(
              width: 150.w,
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
                    width: 110.w,
                    height: 45.h,
                    margin: EdgeInsets.only(top: 3.h),
                    child: TextFormField(
                      keyboardType: TextInputType.number,

                      onChanged: (text) {
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
          ),
        ],
      ),
    );
  }

  Widget _buildDeposit() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      width: 330.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body1Text("Rent", kGrey800Color),
          ),
          Container(
              width: 150.w,
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
                    width: 110.w,
                    height: 45.h,
                    margin: EdgeInsets.only(top: 3.h),
                    child: TextFormField(
                      keyboardType: TextInputType.number,

                      onChanged: (text) {
                      },
                      controller: _controller.rentController,
                      style: TextStyle(color: Colors.black),
                      // 텍스트 색상을 검정색으로 설정
                      textAlign: TextAlign.left,

                      // 텍스트를 왼쪽으로 정렬
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
                        hintText: "Rent",
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
          ),
        ],
      ),
    );
  }

  Widget _buildUtilityBill() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      width: 330.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body1Text("Bill", kGrey800Color),
          ),
          Container(
              width: 150.w,
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
                    width: 110.w,
                    height: 45.h,
                    margin: EdgeInsets.only(top: 3.h),
                    child: TextFormField(
                      keyboardType: TextInputType.number,

                      onChanged: (text) {
                      },
                      controller: _controller.billController,
                      style: TextStyle(color: Colors.black),
                      // 텍스트 색상을 검정색으로 설정
                      textAlign: TextAlign.left,

                      // 텍스트를 왼쪽으로 정렬
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
                        hintText: "bill",
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
          ),
        ],
      ),
    );
  }

}



