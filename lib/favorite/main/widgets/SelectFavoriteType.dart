import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/FavoriteController.dart';

class SelectFavoriteType extends StatelessWidget {
  FavoriteController controller;

  SelectFavoriteType(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.selectType(1);
            },
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Body2Text("집", controller.selectHome ? kTextBlackColor : kGrey500Color),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 9.h),
                    height: 1.h,
                    width: 160.w,
                    color: controller.selectHome ? kBlueColor : kGrey300Color,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.selectType(2);
            },
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Body2Text("일자리",
                        controller.selectJob ? kTextBlackColor : kGrey500Color),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 9.h),
                    height: 1.h,
                    width: 160.w,
                    color: controller.selectJob ? kBlueColor : kGrey300Color,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
