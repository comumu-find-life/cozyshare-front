import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/charge-point/view/CharPointViewAccountView.dart';
import 'package:home_and_job/my-profile/charge-point/widgets/AccountInformationWidget.dart';
import 'package:home_and_job/my-profile/charge-point/widgets/ChargeFinalWidget.dart';

import '../controller/ChargePointController.dart';
import '../widgets/ChargePointFormWidget.dart';

class ChargePointView extends StatelessWidget {
  ChargePointController _controller = ChargePointController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: kWhiteBackGroundColor,
          resizeToAvoidBottomInset: false,
          bottomSheet: _controller.step1 ? _buildStepOneButton(context) : _controller.step2?_buildStepTwoButton(context):_buildStepThreeButton(context),

          //backgroundColor: kGrey100Color,
          appBar: CommonAppBar(
            title: "",
            color: kWhiteBackGroundColor,
            canBack: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _controller.step1 ? ChargePriceForm(_controller) : Container(),
                _controller.step2 ? AccountInformationWidget(_controller) : Container(),
                _controller.step3 ? ChargeFinalWidget(_controller) : Container(),
              ],
            ),
          ),
        ));
  }

  SafeArea? _buildStepOneButton(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: _controller.isNextStep1
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
                      _controller.ontapStep1Next();
                      // Get.to(() => ChargePointAccountView(), transition: Transition.rightToLeftWithFade);
                    },
                    child: ButtonText("다음", kWhiteBackGroundColor),
                  ),
                )
              : null),
    );
  }

  SafeArea? _buildStepTwoButton(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
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
                  _controller.ontapStep2Next();
                  // Get.to(() => ChargePointAccountView(), transition: Transition.rightToLeftWithFade);
                },
                child: ButtonText("step2", kWhiteBackGroundColor),
              ),
            )));
  }

  SafeArea? _buildStepThreeButton(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
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
                  // Get.to(() => ChargePointAccountView(), transition: Transition.rightToLeftWithFade);
                },
                child: ButtonText("step3", kWhiteBackGroundColor),
              ),
            )));
  }



}
