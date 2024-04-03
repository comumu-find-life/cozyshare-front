
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/register-home/controller/RegisterHomeController.dart';

class RegisterHomeImageWidget extends StatelessWidget {

  RegisterHomeController _controller;


  RegisterHomeImageWidget(this._controller);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 13.h),
        width: 320.w,
        height: 260.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color:kGrey300Color),

        ),
        child: Icon(Icons.image),
      ),
    );
  }
}
