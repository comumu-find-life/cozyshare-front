

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/account/sign-up/view/SignupView.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/main/main/frame/MainFrameView.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSignupText(),
        //_buildStartGuest(),


      ],
    );
  }

  Widget _buildStartGuest(){
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 330.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: kBlueColor,
      ),
      child: InkWell(
        onTap: () {
          Get.offAll(() => MainFrameView(0));
        },
        child: Center(
          child: ButtonText("Start to guest", kWhiteBackGroundColor),
        ),
      ),
    );
  }
  


  Widget _buildSignupText(){
    return InkWell(
      onTap: (){
        Get.to(() => SignupView());
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: FRegularText("Don't have an account?", kGrey600Color, 12),
            ),
            Container(
              margin: EdgeInsets.only(left: 5.w, right: 20.w),
              child: FBoldText("Sign up", kDarkBlue, 12),
            )
          ],
        ),
      ),
    );
  }
}
