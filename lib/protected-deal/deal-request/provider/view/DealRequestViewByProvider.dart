import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../../../../model/deal/response/ProtectedDealByGetterResponse.dart';
import '../../../../model/deal/response/ProtectedDealResponse.dart';
import '../../../common/HomeInformationByDealWidget.dart';
import '../../../common/DealInformationWidgetByGetter.dart';
import '../widgets/DepositInformationWidgetByProvider.dart';

/**
 * Getter 에게 보여줄 입금 요청 View
 */
class DealRequestViewByProvider extends StatelessWidget {

  ChatProviderDetailController _chatDetailController;
  ProtectedDealResponse _dealByProviderResponse;

  DealRequestViewByProvider(this._dealByProviderResponse,this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //매물 정보
            HomeInformationByDealWidget(_chatDetailController.home.images!.first, _chatDetailController.home.address!, _chatDetailController.home.rent!, _chatDetailController.home.bond!),
            //거래 정보

            Center(child: DealPriceWidget(deposit: _dealByProviderResponse!.deposit, fee: _dealByProviderResponse!.fee,)),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30.h, bottom: 50.h, left: 15.w, right: 15.w),
                child: Body2Text("The deal can only start after the tenant agrees to accept it.", kGrey500Color),
              ),
            )
          ],
        ),
      ),
    );
  }

}
