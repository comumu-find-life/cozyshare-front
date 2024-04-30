

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/ExchangeController.dart';
import '../widgets/DealHistoryWidget.dart';
import '../widgets/ExchangeHeaderWidget.dart';
import '../widgets/ExchangeHistoryWidget.dart';
import '../widgets/SelectTypeWidget.dart';

class ExchangePointView extends StatelessWidget {
  const ExchangePointView({super.key});

  @override
  Widget build(BuildContext context) {

    ExchangeController _controller= ExchangeController();

    return Scaffold(
      appBar: AppBar(),
      bottomSheet: _buildExchangeButton(context),
      body:  Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExchangeHeaderWidget(),
            SeleteTypeWidget(_controller),
            _controller.selectType==0? DealHistoryWidget() : ExchangeHistoryWidget()
          ],
        )
      ),
    );
  }

  SafeArea _buildExchangeButton(BuildContext context){
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: 360.w,
              margin: EdgeInsets.only(bottom: 10.h),
              color: kWhiteBackGroundColor,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 원하는 borderRadius 값으로 설정
                  ),
                  backgroundColor: kDarkBlue,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide.none, // 테두리 없애기
                  shadowColor: Colors.transparent, // 그림자 없애기
                ),
                onPressed: () {
                  // Get.to(() => ChargePointAccountView(), transition: Transition.rightToLeftWithFade);
                },
                child: ButtonText("출금 신청", kWhiteBackGroundColor),
              ),
            )));
  }
}
