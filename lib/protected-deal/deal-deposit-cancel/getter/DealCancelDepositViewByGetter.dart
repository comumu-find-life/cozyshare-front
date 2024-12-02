

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealByGetterResponse.dart';

import '../../../model/deal/response/ProtectedDealResponse.dart';
import '../../common/DealInformationWidgetByGetter.dart';
import '../../common/HomeInformationByDealWidget.dart';
import '../../deal-request/getter/widgets/DepositInformationWidgetByGetter.dart';

class DealCancelDepositViewByGetter extends StatelessWidget {
  ProtectedDealResponse dealResponse;


  DealCancelDepositViewByGetter(this.dealResponse);

  final String SUB_TEXT = "If you want to restart the deal,  please request it from the landlord again.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //거래 정보
            _buildMainText(),
            Center(
                child: DealPriceWidget(
                  deposit: dealResponse!.deposit,
                  fee: dealResponse!.fee,
                )),


          ],
        ),
      ),
    );
  }

  Widget _buildMainText(){
    return Container(
      margin: EdgeInsets.only(top: 10.h,left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FBoldText("Cancel Deposit", kTextBlackColor, 16),
          Container(
              margin: EdgeInsets.only(top: 10.h),
              child: FRegularText(SUB_TEXT, kGrey800Color, 14))
        ],
      ),
    );
  }
}
