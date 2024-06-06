
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/SignupController.dart';

class EmailForm extends StatelessWidget {
  SignupController _controller;


  EmailForm(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 600.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.h),
            width: 60.w,
            child: Image.asset("assets/icons/email_icon.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h,bottom: 20.h),
            child: FBoldText("Verify Your Email", kGrey700Color, 16),
          ),
          _buildEmailForm(),

          _controller.canInputCode? _buildCheckForm() : Container()
        ],
      ),
    ));
  }

  Widget _buildEmailForm() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20.h),
                    width: 335.w,
                    height: 69.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey400Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Container(
                              width: 300.w,
                              margin: EdgeInsets.only(top: 10.h),
                              child: TextFormField(
                                controller: _controller.emailController,
                                style: TextStyle(color: Colors.black),
                                // 텍스트 색상을 검정색으로 설정
                                textAlign: TextAlign.left,
                                // 텍스트를 왼쪽으로 정렬
                                cursorColor: kTextBlackColor,
                                decoration: InputDecoration(
                                  hintText: 'email', // 힌트 텍스트 설정
                                  hintStyle: TextStyle(
                                      color: kGrey400Color, fontSize: 14.sp),
                                  border: InputBorder.none,
                                  isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                                  prefixIcon: Container(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    child: Icon(
                                      Icons.alternate_email, // 이메일 아이콘 추가
                                      color: kGrey400Color, // 아이콘 색상 설정
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(

                              onTap: (){
                                _controller.sendEmail();
                              },
                              child: Container(
                                child: Icon(Icons.send, color: kPrimaryColor,),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckForm() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 255.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20.h),
                    width: 245.w,
                    height: 69.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey400Color),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 250.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: TextFormField(
                            controller: _controller.emailCheckController,
                            style: TextStyle(color: Colors.black),
                            // 텍스트 색상을 검정색으로 설정
                            textAlign: TextAlign.left,
                            // 텍스트를 왼쪽으로 정렬
                            cursorColor: kTextBlackColor,
                            decoration: InputDecoration(
                              hintText: 'code', // 힌트 텍스트 설정
                              hintStyle: TextStyle(
                                  color: kGrey400Color, fontSize: 14.sp),
                              border: InputBorder.none,
                              isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                              prefixIcon: Container(
                                margin: EdgeInsets.only(bottom: 10.h),
                                child: Icon(
                                  Icons.check, // 이메일 아이콘 추가
                                  color: kGrey400Color, // 아이콘 색상 설정
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              _controller.checkEmailCode();
            },
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 80.w,
              height: 69.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: kPrimaryColor
              ),
              child: Center(
                child: FBoldText("Check", kWhiteBackGroundColor, 14),
              ),
            ),
          )
        ],
      ),
    );
  }

}
