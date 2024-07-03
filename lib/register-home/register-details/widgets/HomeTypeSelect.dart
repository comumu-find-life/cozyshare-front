
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/home/enums/HomeType.dart';
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
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // 가로 스크롤을 허용
        child: Row(
          children: HomeType.values.map((homeType) {
            String? label = homeType.toString().split('.').last.replaceAll('_', ' ').capitalize;
            bool isSelected = _controller.selectedHomeType == homeType;
            return InkWell(
              onTap: () {
                _controller.selectHomeType(homeType);
              },
              child: Container(
                margin: EdgeInsets.only(right: 8.w), // 버튼 간의 간격 조절
                //width: 150.w,
                height: 55.h,
                decoration: BoxDecoration(
                  color: isSelected ? kTextBlackColor : kWhiteBackGroundColor,
                  border: Border.all(color: isSelected ? Colors.transparent : kGrey400Color),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Center(
                    child: Body2Text(label!, isSelected ? kWhiteBackGroundColor : kGrey600Color),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ));
  }

}
