
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import '../../../../common-widgets/button/ButtonWidgets.dart';
import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../controller/HomeRegisterTotalController.dart';
import '../../view/FinishRegisterHomeView.dart';
import '../../widgets/HomeRegisterProcessBar.dart';

class RegisterHomeIntroduceView extends StatelessWidget {

  HomeRegisterTotalController _controller;


  RegisterHomeIntroduceView(this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        title: "",
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeRegisterProcessBar(0.8),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 20.w),
              child:
              Title2Text("Introduce", kTextBlackColor),
            ),
            _buildInputIntroduce(),
            _buildButton()
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 73.h),
      child: Center(child: InkWell(
          onTap: (){
            Get.to(() => FinishRegisterHomeView());
          },
          child: NextButtonWidget("Next"))),
    );
  }


  Widget _buildInputIntroduce(){
    return Container(
      width: 320.w,
      height: 430.h,
      decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
      child: TextFormField(
        onChanged: (text) {},
        controller: null,
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
    );
  }
}
