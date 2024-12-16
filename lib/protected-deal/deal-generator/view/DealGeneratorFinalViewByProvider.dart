import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/protected-deal/common/DealDateTimeWidget.dart';
import 'package:home_and_job/utils/Converter.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../controller/DealGeneratorController.dart';
import '../widgets/FinalDealInformationWidget.dart';

class DealGeneratorFinalViewByProvider extends StatelessWidget {
  DealGeneratorController _controller;
  ChatProviderDetailController _chatDetailController;

  DealGeneratorFinalViewByProvider(
      this._controller, this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar:
          CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      bottomSheet: _buildStepOneButton(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Center(child: FinalDealInformationWidget(_controller)),
            DealDateTimeWidget(ConverterUtil.formatDateTime(_controller.selectDatetime)),
          ],
        ),
      ),
    );
  }




  Widget _buildInformation() {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 340.w,
              child: FRegularText(
                  "The fee is 5% of the deposit, which is to be borne by the tenant. Once the transaction is completed, the deposit amount entered will be received.",
                  kTextBlackColor,
                  14),
            ),
          ),

          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 340.w,
              child: FRegularText(
                  "The tenant can cancel the transaction, but the fee will not be refunded.",
                  kTextBlackColor,
                  14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title2Text("Transaction Information", kTextBlackColor),
        )
      ],
    );
  }

  SafeArea? _buildStepOneButton(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(),
            child: Container(
              height: 70.h,
              width: double.infinity,
              color: kBlueColor,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueColor,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide.none, // 테두리 없애기
                  shadowColor: Colors.transparent, // 그림자 없애기
                ),
                onPressed: () async {
                  int? dealId = await _controller.createDeal(
                      context, _chatDetailController);
                  _chatDetailController.startProtectedDeal(dealId!);
                },
                child: ButtonText("Done", kWhiteBackGroundColor),
              ),
            )));
  }
}
