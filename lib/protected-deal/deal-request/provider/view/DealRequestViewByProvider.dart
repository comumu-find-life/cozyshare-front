import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../../../deal-generator/widgets/DealInformationHeaderWidget.dart';
import '../../../common/DealInformationWidgetByGetter.dart';
import '../widgets/DepositInformationWidgetByProvider.dart';

/**
 * Getter 에게 보여줄 입금 요청 View
 */
class DealRequestViewByProvider extends StatelessWidget {

  ChatProviderDetailController _chatDetailController;


  DealRequestViewByProvider(this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //매물 정보
            DealInformationHeaderWidget(_chatDetailController.home),
            //거래 정보

            Center(child: DealPriceWidget(deposit: _chatDetailController.dealResponse!.deposit, fee: _chatDetailController.dealResponse!.fee,)),
            //Center(child: DealInformationWidgetByGetter(_chatDetailController.dealResponse!)),
            //입금 계좌
            DepositInformationWidgetByProvider(_chatDetailController.dealResponse!),
            //이용약관 도으이
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30.h, bottom: 50.h),
                child: Body2Text("Only the tenant can make deposits", kGrey500Color),
              ),
            )
          ],
        ),
      ),
    );
  }

}
