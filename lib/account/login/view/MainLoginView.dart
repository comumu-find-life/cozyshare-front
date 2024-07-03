import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../api/LoginApi.dart';
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
            LoginFormWidget(controller),
            LoginButtonWidget(controller),
            _buildLine(),
            SignupWidget()
          ],
        ),
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
