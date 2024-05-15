
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeRegisterDetailsController.dart';

class HomeTypeSelect extends StatelessWidget {
  HomeRegisterDetailsController _controller;


  HomeTypeSelect(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title3Text("Room Type", kTextBlackColor),
        ),
        buildInputHomeType(),
      ],
    );
  }

  Widget buildInputHomeType() {
    return Obx(() => Container(
      margin: EdgeInsets.only(top: 30.h, left: 20.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _controller.selectHomeType(1);
            },
            child: _controller.isRentType
                ? Container(
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Rent", kWhiteBackGroundColor),
              ),
            )
                : Container(
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGrey400Color),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Rent", kGrey600Color),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _controller.selectHomeType(2);
            },
            child: _controller.isShareRoomType
                ? Container(
              margin: EdgeInsets.only(left: 8.w),
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: kTextBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Share", kWhiteBackGroundColor),
              ),
            )
                : Container(
              margin: EdgeInsets.only(left: 8.w),
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  border: Border.all(color: kGrey400Color),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Body2Text("Share", kGrey600Color),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
