import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../constants/Fonts.dart';
import '../controller/RegisterAccountController.dart';

class RegisterAccountView extends StatelessWidget {
  RegisterAccountController _controller = RegisterAccountController();
  String HEADER_TEXT = "Bank account information has not been registered yet.";
  String HEADER_TEXT_2 = "Please register your account information first.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildButton(context),
      backgroundColor: kWhiteBackGroundColor,
      appBar:
          CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildAmountForm(),
            _buildBsbForm(),
            _buildAccountNumberForm()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w, top: 10.h),
            width: 110.w,
            child: Image.asset("assets/icons/credit-card.png"),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                width: 200.w,
                child: FBoldText(HEADER_TEXT, kTextBlackColor, 14),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 19.h),
                width: 200.w,
                child: FBoldText(HEADER_TEXT_2, kGrey700Color, 13),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Obx(() => _controller.canRegister.value == true
        ? Container(
      height: 70.h,
            width: double.infinity,
            color: kPrimaryColor,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                side: BorderSide.none,
                shadowColor: Colors.transparent,
              ),
              onPressed: () async {
                _controller.createAccount(context);
              },
              child: ButtonText("Register", kWhiteBackGroundColor),
            ),
          )
        : Container(
        height: 70.h,
            width: double.infinity,
            color: kGrey200Color,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kGrey200Color,
                side: BorderSide.none,
                shadowColor: Colors.transparent,
              ),
              onPressed: () async {
                CustomSnackBar().show(context, "Please enter all values.");
              },
              child: ButtonText("Register", kWhiteBackGroundColor),
            ),
          ));
  }

  Widget _buildAmountForm() {
    return Center(
      child: Container(
        width: 335.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.h),
              child: FBoldText("Depositor's Name", kTextBlackColor, 14),
            ),
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
                  onChanged: (value) {
                    _controller.validateInput();
                  },
                  controller: _controller.depositorNameController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.center,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: kGrey700Color, fontSize: 14.sp),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBsbForm() {
    return Center(
      child: Container(
        width: 335.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: FBoldText("Bsb", kTextBlackColor, 14),
            ),
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
                  onChanged: (value) {
                    _controller.validateInput();
                  },
                  keyboardType: TextInputType.number,
                  controller: _controller.bsbController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.center,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "only number",
                    hintStyle: TextStyle(color: kGrey700Color, fontSize: 14.sp),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountNumberForm() {
    return Center(
      child: Container(
        width: 335.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: FBoldText("Account Number", kTextBlackColor, 14),
            ),
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
                  onChanged: (value) {
                    _controller.validateInput();
                  },
                  keyboardType: TextInputType.number,
                  controller: _controller.accountNumberController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.center,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "only number",
                    hintStyle: TextStyle(color: kGrey700Color, fontSize: 14.sp),
                    border: InputBorder.none,
                    isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
