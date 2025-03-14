import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/reservation/reservation-generator/view/ReserveByGetterView.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../protected-deal/deal-generator/view/DealGeneratorViewByProvider.dart';
import '../controller/ChatGetterDetailController.dart';

/**
 * 채팅방 상단에 보여줄 거래 매물 정보 위젯
 */

class GetterHomePostInformationWidget extends StatelessWidget {
  ChatGetterDetailController _controller;

  GetterHomePostInformationWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return _buildGetterWidget();
  }

  Widget _buildGetterWidget() {
    return Container(
      width: 380.w,
      height: 70.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        color: kWhiteBackGroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHomeInformation(),
        ],
      ),
    );
  }

  Widget _buildHomeInformation() {
    return InkWell(
      onTap: () {
        Get.to(() => RoomDetailView(_controller.home.homeId!, true));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 65.w,
                  height: 60.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/test/home.png",
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 290.w,
                      child:
                      Body2Text("${_controller.home.address}", kTextBlackColor),
                    ),
                    // )
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
