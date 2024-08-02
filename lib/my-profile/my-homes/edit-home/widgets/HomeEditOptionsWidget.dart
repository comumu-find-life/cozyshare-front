import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/controller/HomeEditController.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/home/enums/HomeOption.dart';


class HomeEditOptionsWidget extends StatelessWidget {
  HomeEditController _controller;


  HomeEditOptionsWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 240.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h, left: 20.w),
            child: Title2Text("Options", kTextBlackColor),
          ),
          Container(
            width: 360.w,
            height: 230.h,
            margin: EdgeInsets.only(left: 0.w, top: 20.h),
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.6.h),
              ),
              itemCount: HomeOptionType.values.length, // 아이템 수
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 스크롤 비활성화
              itemBuilder: (context, index) {
                // 아이템 빌드
                return _buildOptionItem(HomeOptionType.values[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  //옵션 선택 아이템
  Widget _buildOptionItem(HomeOptionType type) {

    return Obx(() => InkWell(
      onTap: () {
        _controller.toggleOption(type);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: 70.w,
            height: 70.h, // 높이 조정
            decoration: BoxDecoration(
              border: Border.all(color: _controller.selectedOptions.contains(type) ? kBlueColor :kGrey300Color),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color:  Colors.transparent, // 선택된 아이템의 색상을 파란색으로 변경
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5.h),
              child: Icon(
                type.icon,
                color: _controller.selectedOptions.contains(type) ? kBlueColor :kGrey700Color,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: FRegularText(type.text, _controller.selectedOptions.contains(type) ? kBlueColor :kGrey700Color, 13),
          )
        ],
      ),
    ));
  }
}
