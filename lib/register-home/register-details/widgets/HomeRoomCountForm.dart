
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeRegisterDetailsController.dart';

class HomeRoomCountForm extends StatelessWidget {
  HomeRegisterDetailsController _controller;

  HomeRoomCountForm(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title3Text("Total BedRoom", kTextBlackColor),
        ),
        _buildInputBedRoomCount(),
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title3Text("Total BathRoom", kTextBlackColor),
        ),
        _buildInputBathRoomCount(),
      ],
    );
  }

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

            keyboardType: TextInputType.number,
            onChanged: (text) {
              _controller.validateAllInput();
            },
            controller: _controller.bedRoomCountController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "Count",
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
            keyboardType: TextInputType.number,
            onChanged: (text) {
              _controller.validateAllInput();
            },
            controller: _controller.bathRoomCountController,
            style: TextStyle(color: Colors.black),
            // 텍스트 색상을 검정색으로 설정
            textAlign: TextAlign.left,

            // 텍스트를 왼쪽으로 정렬
            cursorColor: kTextBlackColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
              hintText: "Count",
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
