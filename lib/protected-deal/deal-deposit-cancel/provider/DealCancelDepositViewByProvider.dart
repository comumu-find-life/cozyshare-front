


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealByGetterResponse.dart';

import '../../../model/deal/response/ProtectedDealResponse.dart';
import '../../common/DealInformationWidgetByGetter.dart';

class DealCancelDepositViewByProvider extends StatelessWidget {
  ProtectedDealResponse dealResponse;


  DealCancelDepositViewByProvider(this.dealResponse);

  final String SUB_TEXT = "This deal has been canceled by the other party. If you wish to restart the deal, please press the 'Deal' button at the top of the chat screen.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
