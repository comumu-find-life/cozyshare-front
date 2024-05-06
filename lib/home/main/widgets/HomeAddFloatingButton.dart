
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../../constants/Fonts.dart';
import '../../../register-home/register-image/view/RegisterHomeImageView.dart';

Container OldGoalFloatingButton() {
  return Container(
    margin: EdgeInsets.only(right: 10.w),
    child: ConstrainedBox(

      constraints: BoxConstraints.tightFor(width: 110, height: 40),
      child:  FloatingActionButton(

        onPressed: () {
          Get.to(() => RegisterHomeImageView(), transition: Transition.fadeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(Icons.add,size: 17.sp,),
            ),
            Container(
              margin: EdgeInsets.only(right: 0.w),
              child: ButtonText(
                  " 집 등록",
                  kWhiteBackGroundColor
              ),
            ),
          ],
        ),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        foregroundColor: Colors.white,
        backgroundColor: kTextBlackColor,
      ),
    ),
  );
}