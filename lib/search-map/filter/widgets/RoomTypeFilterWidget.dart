import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/FilterController.dart';

class RoomTypeFilterWidget extends StatelessWidget {
  FilterController _controller;
  RoomTypeFilterWidget(this._controller);

  @override
  Widget build(BuildContext context) {

    return Obx(() => Container(
          width: 380.w,
          color: kWhiteBackGroundColor,
          margin: EdgeInsets.only(top: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.h, left: 18.w),
                child: FBoldText("Room Type", kTextBlackColor, 14),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 15.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.ontapRoomType(HomeType.RENT);
                      },
                      child: Container(
                        width: 70.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: _controller.roomType == HomeType.RENT
                                ? kDarkBlue
                                : null,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: _controller.roomType == HomeType.RENT
                                    ? kDarkBlue
                                    : kGrey400Color)),
                        child: Center(
                          child: FRegularText(
                              "Rent",
                              _controller.roomType == HomeType.RENT
                                  ? kWhiteBackGroundColor
                                  : kTextBlackColor,
                              14),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.ontapRoomType(HomeType.SHARE);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 6.w),
                        width: 70.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: _controller.roomType == HomeType.SHARE
                                ? kDarkBlue
                                : null,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: _controller.roomType == HomeType.SHARE
                                    ? kDarkBlue
                                    : kGrey400Color)),
                        child: Center(
                          child: FRegularText(
                              "Share",
                              _controller.roomType == HomeType.SHARE
                                  ? kWhiteBackGroundColor
                                  : kTextBlackColor,
                              14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.h),
                width: 380.w,
                height: 2.h,
                color: kGrey100Color,
              )
            ],
          ),
        ));
  }
}
