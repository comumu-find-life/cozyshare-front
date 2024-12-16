
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/chatting/chat-common/widgets/ChatAppBar.dart';
import 'package:home_and_job/chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../constants/Fonts.dart';
import '../../../protected-deal/common/HomeInformationByDealWidget.dart';
import '../../common/widgets/ReservationPriceWidget.dart';
import '../controller/ReservationGeneratorController.dart';
import '../widgets/ReservationDateTimePick.dart';

class ReservationByGetterView extends StatelessWidget {
  ChatGetterDetailController _chatController;
  ReservationGeneratorController _reservationGeneratorController = new ReservationGeneratorController();


  ReservationByGetterView(this._chatController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildButton(context),
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteColor),
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeInformationByDealWidget(_chatController.home.images!.first, _chatController.home.address!, _chatController.home.rent!, _chatController.home.bond!),
            ReservationDatetimePick(_reservationGeneratorController),
            ReservationPriceWidget()
          ],
        ),
      ),
    );
  }


  Widget _buildButton(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      color: kWhiteColor,
      child: Column(
        children: [
          Divider(
            color: kGrey300Color, // 회색 선 색상
            thickness: 0.6,       // 선 두께
            height: 1,          // 선의 높이
          ),
          Expanded( // 나머지 공간을 차지하도록 설정
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.w, bottom: 15.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                    crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
                    children: [
                      Body2Text("Reservation amount", kGrey700Color),
                      SizedBox(height: 5.h),
                      Body1Text("\$50", kTextBlackColor),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.w, bottom: 15.h),
                  width: 100.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Center(
                    child: FBoldText("Pay", kWhiteColor, 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
