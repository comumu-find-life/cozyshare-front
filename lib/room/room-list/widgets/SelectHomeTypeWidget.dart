

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/RoomListController.dart';

class SelectHomeTypeWidget extends StatelessWidget {
  RoomListController _controller;


  SelectHomeTypeWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 10.h),
      child: Row(
        children: [
          _controller.selectRentHome
              ? Container(
              width: 70.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: kGrey300Color)),
              child: InkWell(
                onTap: () {
                  _controller.selectHomeType(1);
                },
                child: Center(
                  child: Container(
                    child: Body2Text("렌트", kWhiteBackGroundColor),
                  ),
                ),
              ))
              : Container(
              width: 70.w,
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: kGrey300Color)),
              child: InkWell(
                onTap: () {
                  _controller.selectHomeType(1);
                },
                child: Center(
                  child: Container(
                    child: Body2Text("렌트", kTextBlackColor),
                  ),
                ),
              )),
          _controller.selectShareHome
              ? Container(
              width: 100.w,
              height: 40.h,
              margin: EdgeInsets.only(left: 8.w),
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: kGrey300Color)),
              child: InkWell(
                onTap: () {
                  _controller.selectHomeType(2);
                },
                child: Center(
                  child: Container(
                    child: Body2Text("쉐어 하우스", kWhiteBackGroundColor),
                  ),
                ),
              ))
              : Container(
              width: 100.w,
              height: 40.h,
              margin: EdgeInsets.only(left: 8.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: kGrey300Color)),
              child: InkWell(
                onTap: () {
                  _controller.selectHomeType(2);
                },
                child: Center(
                  child: Container(
                    child: Body2Text("쉐어 하우스", kTextBlackColor),
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
