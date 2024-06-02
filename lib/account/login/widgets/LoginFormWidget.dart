

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../constants/Colors.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {

  bool ischeck = false;
  bool isWrongInformation = false;
  bool _obscurePassword = true;
  TextEditingController _idController = TextEditingController();
  TextEditingController _passworController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200.h),
      width: 380.w,
      color: kWhiteBackGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          _buildLoginForm(),
          _buildPasswordForm(),
          //_buildAutoLoginCheckBox()
        ],
      ),
    );
  }

  Widget _buildLoginForm(){
    return Center(
      child: Container(
        width: 335.w,
        margin: EdgeInsets.only(top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 335.w,
              height: 46.h,
              margin: EdgeInsets.only(top: 5.h),
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                // 힌트 텍스트와 입력란 간의 간격 조정
                child: TextFormField(
                  controller: _idController,
                  style: TextStyle(color: Colors.black),
                  // 텍스트 색상을 검정색으로 설정
                  textAlign: TextAlign.left,
                  // 텍스트를 왼쪽으로 정렬
                  cursorColor: kTextBlackColor,
                  decoration: InputDecoration(
                    hintText: "ID",
                    hintStyle:
                    TextStyle(color: kGrey400Color, fontSize: 14.sp),
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

  Widget _buildPasswordForm(){
    return Container(
      width: 335.w,
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335.w,
            height: 46.h,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              // 힌트 텍스트와 입력란 간의 간격 조정
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextFormField(
                    controller: _passworController,
                    obscureText: _obscurePassword,
                    style: TextStyle(color: Colors.black),
                    // 텍스트 색상을 검정색으로 설정
                    textAlign: TextAlign.left,
                    // 텍스트를 왼쪽으로 정렬
                    cursorColor: kTextBlackColor,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle:
                      TextStyle(color: kGrey400Color, fontSize: 14.sp),
                      border: InputBorder.none,
                      isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildAutoLoginCheckBox() {
    return Container(
      margin: EdgeInsets.only(right: 165.w, bottom: 20.h),
      width: 185.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.black, // 테두리 색 (unchecked 상태의 색)
            ),
            child: Checkbox(
              focusColor: Colors.grey,
              checkColor: kTextBlackColor,
              activeColor: Colors.white,
              // 체크된 상태의 배경색
              value: ischeck,
              onChanged: (value) {
                setState(() {
                  ischeck = value!;
                });
              },
              side: BorderSide(
                  color: ischeck ? Colors.black : Colors.black), // 테두리 색상 변경
            ),
          ),
          Text(
            "자동로그인",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: kTextBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
