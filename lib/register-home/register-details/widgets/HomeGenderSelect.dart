import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeRegisterDetailsController.dart';

class HomeGenderSelect extends StatelessWidget {
  final HomeRegisterDetailsController _controller;

  HomeGenderSelect(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title3Text("Gender Type", kTextBlackColor),
        ),
        buildInputGenderType(),
      ],
    );
  }

  Widget buildInputGenderType() {
    return Obx(() => Container(
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
      child: Row(
        children: [
          genderTypeButton(1, "Male"),
          SizedBox(width: 8.w),
          genderTypeButton(2, "Female"),
          SizedBox(width: 8.w),
          genderTypeButton(3, "Anything"),
        ],
      ),
    ));
  }

  Widget genderTypeButton(int type, String label) {
    bool isSelected = _controller.isGenderType == type;
    return InkWell(
      onTap: () => _controller.selectGenderType(type),
      child: Container(
        width: 80.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: isSelected ? kTextBlackColor : kWhiteBackGroundColor,
          border: Border.all(color: isSelected ? Colors.transparent : kGrey400Color),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Body2Text(label, isSelected ? kWhiteBackGroundColor : kGrey600Color),
        ),
      ),
    );
  }
}
