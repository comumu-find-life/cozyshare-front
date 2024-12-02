import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/MainLoginController.dart';

class LoginButtonWidget extends StatelessWidget {
  MainLoginController controller;

  LoginButtonWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          margin: EdgeInsets.only(top: 30.h),
          width: 330.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: kBlueColor,
          ),
          child: InkWell(
            onTap: () {
              controller.login(context);
            },
            child: Center(
              child: ButtonText("Login", kWhiteBackGroundColor),
            ),
          ),
        )
      ],
    );
  }
}
