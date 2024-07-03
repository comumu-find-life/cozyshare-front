import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/FilterController.dart';

class RoomTypeFilterWidget extends StatelessWidget {
  final FilterController _controller;

  RoomTypeFilterWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Wrap(
              spacing: 10.w,
              children: HomeType.values.map((type) {
                return type == HomeType.NONE
                    ? Container()
                    : buildRoomTypeButton(type);
              }).toList(),
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
    );
  }

  Widget buildRoomTypeButton(HomeType type) {
    String buttonText = type.value;

    // Measure the text size to adjust the button width accordingly
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: buttonText,
        style: TextStyle(fontSize: 17.sp),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    double textWidth = textPainter.width.w - 20.w;

    return InkWell(
      onTap: () {
        _controller.ontapRoomType(type);
      },
      child: Obx(
            () => Container(
              margin: EdgeInsets.only(bottom: 10.h),
          width: textWidth + 50.w, // Add padding around the text
          height: 50.h,
          decoration: BoxDecoration(
            color: _controller.roomTypes.contains(type) ? kDarkBlue : null,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: _controller.roomTypes.contains(type)
                  ? kDarkBlue
                  : kGrey400Color,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Center(
              child: FRegularText(
                buttonText, // Display the text representation of HomeType
                _controller.roomTypes.contains(type)
                    ? kWhiteBackGroundColor
                    : kTextBlackColor,
                14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
