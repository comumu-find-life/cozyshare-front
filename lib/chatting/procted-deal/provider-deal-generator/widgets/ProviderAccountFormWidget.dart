import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../constants/Colors.dart';
import '../controller/ProtectedDealGeneratorController.dart';

class ProviderAccountFormWidget extends StatelessWidget {
  ProtectedDealGeneratorController _controller;


  ProviderAccountFormWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMainText(),
        _buildInputName(),
        _buildBankName(),
        _buildAccount()
      ],
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 60.h, left: 20.w),
      child: Row(
        children: [
          Container(
            child: Title2Text("계좌 정보 입력", kTextBlackColor),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 5.w),
              child: Icon(
                Icons.report,
                color: kDarkBlue,
                size: 18.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 335.w,
            margin: EdgeInsets.only(top: 25.h,left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: HintText3("예금주", kGrey600Color),
                ),
                Container(
                  width: 320.w,
                  height: 45.h,

                  margin: EdgeInsets.only(top: 5.h),
                  decoration: BoxDecoration(
                    //color: kGrey300Color,
                    border: Border(
                      bottom: BorderSide(width: 1, color: kGrey200Color),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextFormField(

                      controller: _controller.nameController,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      textAlign: TextAlign.left,
                      onChanged: (text) {
                        // 현재 텍스트필드의 텍스트를 출력
                        _controller.updateAccountController();
                      },
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "이름",
                        hintStyle: TextStyle(color: kGrey300Color),
                       // labelText: controller.text.isEmpty ? "이름" : "이름",
                        //labelStyle: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 13.sp, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(0, 7, 0, -10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }


  Widget _buildBankName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 335.w,
            margin: EdgeInsets.only(top: 25.h,left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: HintText3("은행", kGrey600Color),
                ),
                Container(
                  width: 320.w,
                  height: 45.h,

                  margin: EdgeInsets.only(top: 5.h),
                  decoration: BoxDecoration(
                    //color: kGrey300Color,
                    border: Border(
                      bottom: BorderSide(width: 1, color: kGrey200Color),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextFormField(
                      onChanged: (text) {
                        // 현재 텍스트필드의 텍스트를 출력
                        _controller.updateAccountController();
                      },
                      controller: _controller.bankController,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      textAlign: TextAlign.left,
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "이름",
                        hintStyle: TextStyle(color: kGrey300Color),
                        // labelText: controller.text.isEmpty ? "이름" : "이름",
                        //labelStyle: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 13.sp, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(0, 7, 0, -10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 335.w,
            margin: EdgeInsets.only(top: 25.h,left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: HintText3("계좌번호", kGrey600Color),
                ),
                Container(
                  width: 320.w,
                  height: 45.h,

                  margin: EdgeInsets.only(top: 5.h),
                  decoration: BoxDecoration(
                    //color: kGrey300Color,
                    border: Border(
                      bottom: BorderSide(width: 1, color: kGrey200Color),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextFormField(
                      onChanged: (text) {
                        // 현재 텍스트필드의 텍스트를 출력
                        _controller.updateAccountController();
                      },
                      controller: _controller.accountController,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      textAlign: TextAlign.left,
                      cursorColor: kTextBlackColor,
                      decoration: InputDecoration(
                        hintText: "입력하세요.",
                        hintStyle: TextStyle(color: kGrey300Color),
                        // labelText: controller.text.isEmpty ? "이름" : "이름",
                        //labelStyle: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 13.sp, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(0, 7, 0, -10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
