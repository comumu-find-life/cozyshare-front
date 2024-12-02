

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/SignupController.dart';

class PrivacyForm extends StatelessWidget {
  SignupController _controller;


  PrivacyForm(this._controller);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      child: Column(
        children: [
          _buildMainText(),
          _buildPasswordForm(),
          _buildPasswordCheckForm(),
        ],
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Body2Text(
          "Create an account. \nFill out this short form and request a card after",
          kGrey500Color),
    );
  }

  Widget _buildNameForm() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 335.w,
                    height: 86.h,
                    margin: EdgeInsets.only(top: 5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey500Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h, left: 15.w),
                          child: FRegularText("Full Name", kGrey700Color, 13),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // 힌트 텍스트와 입력란 간의 간격 조정
                          child: TextFormField(
                            onChanged: (text) {
                              _controller.validatePrivacy();
                            },
                            controller: _controller.nameController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: kGrey700Color, fontSize: 14.sp),
                              border: InputBorder.none,
                              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPasswordForm() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 335.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 335.w,
                    height: 86.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey500Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h, left: 15.w),
                          child: FRegularText("Password", kGrey700Color, 13),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // 힌트 텍스트와 입력란 간의 간격 조정
                          child: TextFormField(
                            onChanged: (text) {
                              _controller.validatePrivacy();
                            },
                            obscureText: true,
                            controller: _controller.pwController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: kGrey400Color, fontSize: 14.sp),
                              border: InputBorder.none,
                              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCheckForm() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 335.w,
                    height: 86.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey500Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h, left: 15.w),
                          child: FRegularText("Password Confirm", kGrey700Color, 13),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // 힌트 텍스트와 입력란 간의 간격 조정
                          child: TextFormField(
                            onChanged: (text) {
                              _controller.validatePrivacy();
                            },
                            obscureText: true,
                            controller: _controller.pwCheckController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: kGrey400Color, fontSize: 14.sp),
                              border: InputBorder.none,
                              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
