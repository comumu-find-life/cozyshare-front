import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../my-point/controller/MyPointController.dart';


class InputCashOutTextForm extends StatefulWidget {
  MyPointController _controller;

  InputCashOutTextForm(this._controller);

  @override
  State<InputCashOutTextForm> createState() => _InputCashOutTextForm();
}

class _InputCashOutTextForm extends State<InputCashOutTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: FBoldText("Cash Out Amount", kTextBlackColor, 13),
          ),
          _buildAmountForm(),
        ],
      ),
    );
  }


  Widget _buildAmountForm() {
    return Center(
      child: Container(
        width: 335.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 335.w,
                  height: 56.h,
                  margin: EdgeInsets.only(top: 15.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey300Color),
                    color: kWhiteBackGroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    // 힌트 텍스트와 입력란 간의 간격 조정
                    child: TextFormField(
                      controller: widget._controller.cashOutTextController,
                      style: TextStyle(color: Colors.black),
                      // 텍스트 색상을 검정색으로 설정
                      textAlign: TextAlign.right,
                      // 텍스트를 왼쪽으로 정렬
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "Numbers only",
                        hintStyle:
                        TextStyle(color: kGrey700Color, fontSize: 14.sp),
                        border: InputBorder.none,
                        isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(
                      margin: EdgeInsets.only(top: 35.h, right: 20.w),
                      child: FBoldText("\$", kTextBlackColor, 14),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
