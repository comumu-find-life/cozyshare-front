import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:home_and_job/chatting/procted-deal/provider-deal-generator/controller/ProtectedDealGeneratorController.dart';
import 'package:home_and_job/chatting/procted-deal/provider-deal-generator/widgets/DealInformationHeaderWidget.dart';
import 'package:home_and_job/chatting/procted-deal/provider-deal-generator/widgets/ProviderAccountFormWidget.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import 'ProtectedDealGeneratorView.dart';

class ProtectedDealStartView extends StatelessWidget {
  ProtectedDealGeneratorController _controller =
      ProtectedDealGeneratorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      resizeToAvoidBottomInset: true,
      bottomSheet: _buildStepOneButton(context),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom +
              30.h, // 키보드가 올라올 때 여백 추가
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DealInformationHeaderWidget(),
            ProviderAccountFormWidget(_controller),
          ],
        ),
      ),
    );
  }

  SafeArea? _buildStepOneButton(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.only(),
          child: _controller.finishAccountInformation
              ? Container(
                  width: double.infinity,
                  color: kBlueColor,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlueColor,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide.none, // 테두리 없애기
                      shadowColor: Colors.transparent, // 그림자 없애기
                    ),
                    onPressed: () {
                      //_controller.ontapStep1Next();
                      Get.to(
                        () => ProtectedDealGeneratorView(_controller),
                      );
                    },
                    child: ButtonText("다음", kWhiteBackGroundColor),
                  ),
                )
              : null),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kWhiteBackGroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            child: Body2Text("안전결제란?", kBlueColor),
          )
        ],
      ),
    );
  }
}
