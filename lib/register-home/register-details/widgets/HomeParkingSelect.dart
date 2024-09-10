import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeRegisterDetailsController.dart';

class HomeParkingSelect extends StatelessWidget {
  HomeRegisterDetailsController _controller;

  HomeParkingSelect(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 20.w),
              child: Title3Text("Parking", kTextBlackColor),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w,top: 20.h),
              width: 290.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _controller.onTapParking(true);
                    },
                    child: Container(
                      width: 140.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: _controller.canParking
                              ? kTextBlackColor
                              : kWhiteBackGroundColor,
                          border: Border.all(
                              color: _controller.canParking
                                  ? kTextBlackColor
                                  : kGrey500Color)),
                      child: Center(
                        child: FRegularText("Available", _controller.canParking
                            ? kWhiteBackGroundColor
                            : kGrey500Color, 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.onTapParking(false);
                    },
                    child: Container(
                      width: 140.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: !_controller.canParking
                              ? kTextBlackColor
                              : kWhiteBackGroundColor,
                          border: Border.all(
                              color: !_controller.canParking
                                  ? kTextBlackColor
                                  : kGrey500Color)),
                      child: Center(
                        child: FRegularText("Not Available", !_controller.canParking
                            ? kWhiteBackGroundColor
                            : kGrey500Color, 14),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
