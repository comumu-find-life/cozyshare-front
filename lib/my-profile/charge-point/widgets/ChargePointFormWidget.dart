

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/ChargePointController.dart';

Widget ChargePriceForm(ChargePointController _controller){
  return Container(
    color: kWhiteBackGroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 100.h),
            child: Title2Text("충전 금액을 입력하세요.", kTextBlackColor),
          ),
        ),
        Center(
          child: Container(
            width: 170.w,
            height: 47.h,
            margin: EdgeInsets.only(top: 20.h, right: 10.w),
            //color: kBlueColor,
            child: TextFormField(
              keyboardType: TextInputType.number,

              onChanged: (text) {
                // 값이 변경될 때마다 실행되는 콜백
                String newText =
                text.replaceAll(RegExp(r'[^0-9]'), ''); // 입력된 숫자만 추출
                if (newText.isNotEmpty) {
                  // 값이 비어 있지 않은 경우
                  newText += "\$"; // 달러 표시를 추가
                }
                _controller.priceController.value =
                    _controller.priceController.value.copyWith(
                      text: newText, // 새로운 텍스트 설정
                      selection: TextSelection.collapsed(
                          offset: newText.length - 1), // 커서 위치 설정
                    );
                _controller.validateNext1();
              },
              controller: _controller.priceController,
              style: TextStyle(color: Colors.black, fontFamily: "Number"),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.center,

              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.h, top: 6.h),
                hintText: "충전할 금액을 입력하세요.",
                hintStyle: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade500,
                    fontFamily: "Number"),
                border: InputBorder.none,
                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
              ),
            ),
          ),
        ),
      ],
    ),
  );
}