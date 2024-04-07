import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/register-home/controller/RegisterHomeController.dart';

class RegisterHomeImageWidget extends StatelessWidget {
  RegisterHomeController _controller;

  RegisterHomeImageWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 30.w),
          child: Title3Text("최소 한장의 집 사진을 등록해주세요.", kTextBlackColor),
        ),
        InkWell(
          onTap: () {
            _controller.registerImage();
          },
          child: Center(
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 20.h),
              width: 320.w,
              height: 260.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: kGrey300Color),
              ),
              child: Icon(Icons.image),
            ),
          ),
        )
      ],
    );
  }
}
