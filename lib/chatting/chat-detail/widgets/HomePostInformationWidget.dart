import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/home/response/HomeOverviewResponse.dart';
import '../../../protected-deal/deal-generator/view/DealGeneratorViewByProvider.dart';

/**
 * 채팅방 상단에 보여줄 거래 매물 정보 위젯
 */

class HomePostInformationWidget extends StatelessWidget {
  ChatDetailController _controller;

  HomePostInformationWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return _controller.sender.id.toString() == _controller.home.providerId.toString()
        ? _buildProviderWidget()
        : _buildGetterWidget();
  }

  Widget _buildProviderWidget() {
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

          _buildHomeInformation(true),
          _buildStartDeal(),
        ],
      ),
    );
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
          _buildHomeInformation(false),
        ],
      ),
    );
  }

  Widget _buildStartDeal() {
    return InkWell(
      onTap: () {
        Get.to(() => DealGeneratorViewByProvider(_controller));
        //_controller.startProtectedDeal();
      },
      child: Container(
          width: 80.w,
          height: 50.h,
          decoration: BoxDecoration(

              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          margin: EdgeInsets.only(right: 10.w),
          child: Center(
            child: Body2Text("Deal", kWhiteBackGroundColor),
          )),
    );
  }

  Widget _buildHomeInformation(bool isProvider) {
    return InkWell(
      onTap: () {
        Get.to(() => RoomDetailView(1, true));
      },
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 10.w),
              width: 85.w,
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
                  width: isProvider ? 180.w : 230.w,
                  child:
                      Body2Text("${_controller.home.address}", kTextBlackColor),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 6.h),
                //   child: HelperText("rent : ${_controller.home.rent}", kGrey600Color),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
