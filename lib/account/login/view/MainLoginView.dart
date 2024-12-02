import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../rest-api/user-api/LoginApi.dart';
import '../controller/MainLoginController.dart';
import '../widgets/LoginButtonWidget.dart';
import '../widgets/LoginFormWidget.dart';
import '../widgets/SignupWidget.dart';

class MainLoginView extends StatelessWidget {
  MainLoginController controller = MainLoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildOauthIcons(),
            _buildLine(),
            LoginFormWidget(controller),
            SignupWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildOauthIcons(){
    return Container(
      margin: EdgeInsets.only(top: 220.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              controller.loginGoogle();
            },
            child: Container(
              width: 255.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: kGrey100Color,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 17.w),
                      width: 22.w,
                      height: 22.w,
                      child: Image.asset("assets/icons/google_icon.png")),
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Body1Text("Sign in with Google", kTextBlackColor),
                  )
                ],
              )
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 255.w,
            height: 40.h,
            child: Image.asset("assets/icons/apple_icon.png"),
          ),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 360.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150.w,
            height: 1.h,
            color: kGrey300Color,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 5.w, right: 5.w),
              child: FRegularText("or", kGrey400Color, 13),
            ),
          ),
          Container(
            width: 150.w,
            height: 1.h,
            color: kGrey300Color,
          ),
        ],
      ),
    );
  }
}
