import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealByGetterResponse.dart';
import 'package:home_and_job/protected-deal/deal-request/getter/poopup/PointChargePopup.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../../chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import '../../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/response/ProtectedDealResponse.dart';
import '../../../common/HomeInformationByDealWidget.dart';
import '../controller/DealRequestControllerByGetter.dart';
import '../widgets/DealRequestAgreeWidget.dart';
import '../widgets/DepositInformationWidgetByGetter.dart';
import '../../../common/DealInformationWidgetByGetter.dart';

/**
 * Getter 에게 보여줄 입금 요청 View
 */
class DealRequestViewByGetter extends StatelessWidget {
  int dealId;
  ChatGetterDetailController _chatDetailController;
  DealRequestControllerByGetter _controller = DealRequestControllerByGetter();

  DealRequestViewByGetter(this.dealId, this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    var dealResponse = _chatDetailController.getDealById(dealId);
    bool _canRequestDeposit =
        dealResponse?.dealState == DealState.REQUEST_DEAL ? true : false;
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: _canRequestDeposit
          ? _buildStepOneButton(dealResponse!, context)
          : null,
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeInformationByDealWidget(_chatDetailController.home.images!.first, _chatDetailController.home.address!, _chatDetailController.home.rent!, _chatDetailController.home.bond!),
            //거래 정보
            Center(
                child: DealPriceWidget(
              deposit: dealResponse!.deposit,
              fee: dealResponse!.fee,
            )),

            //이용약관 도으이
            if (_canRequestDeposit)
              DealRequestAgreeWidget(controller: _controller),
            Container(
              height: 130.h,
            )
          ],
        ),
      ),
    );
  }

  Obx _buildStepOneButton(
      ProtectedDealResponse dealResponse, BuildContext context) {
    return Obx(() => Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 110.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kErrorColor,
                  //padding: EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide.none, // 테두리 없애기
                  shadowColor: Colors.transparent, // 그림자 없애기
                ),
                onPressed: () async {
                  // await _controller.cancelDeposit(dealId);
                },
                child: ButtonText("Cancel", kWhiteBackGroundColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5.w),
              width: 250.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _controller.canNext ? kBlueColor : kGrey200Color,
                  //padding: EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide.none, // 테두리 없애기
                  shadowColor: Colors.transparent, // 그림자 없애기
                ),
                onPressed: () async {
                  if (_controller.canNext) {
                    bool? response = await _chatDetailController.checkUserPoint(dealId);
                    if(!response!){
                      Pointchargepopup().showPopup(_chatDetailController.userAccountResponse!, context);
                    }else{
                      await _controller.acceptDeal(dealResponse!.id);
                      _chatDetailController.applyDeposit(dealResponse!.id);
                      Navigator.pop(context);
                    }

                  }
                },
                child: ButtonText("Acceptance", kWhiteBackGroundColor),
              ),
            ),
          ],
        )));
  }
}
