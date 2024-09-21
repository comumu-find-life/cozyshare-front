import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/controller/HomeEditController.dart';

Widget HomeEditIntroduceViewWidget(HomeEditController _controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 40.h, left: 20.w),
        child: Title2Text("Introduce", kTextBlackColor),
      ),
      Container(
        width: 330.w,
        height: 400.h,
        decoration: BoxDecoration(
            border: Border.all(color: kGrey200Color),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        margin: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 10.h),
        child: TextFormField(
          maxLines: null, // 입력할 수 있는 줄 수를 제한하지 않음
          expands: true,  // 텍스트 필드가 남은 공간을 채우도록 설정
          onChanged: (text) {
          },
          controller: _controller.introduceController,
          style: TextStyle(color: Colors.black),
          // 텍스트 색상을 검정색으로 설정
          textAlign: TextAlign.left,

          // 텍스트를 왼쪽으로 정렬
          cursorColor: kTextBlackColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
            hintText: "Input Content",
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

