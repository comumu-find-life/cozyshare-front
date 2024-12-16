import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';
import 'package:home_and_job/protected-deal/deal-request/getter/poopup/BeforeDepositCancelPopup.dart';
import 'package:home_and_job/protected-deal/deal-request/getter/poopup/PointChargePopup.dart';
import 'package:home_and_job/protected-deal/deal-request/getter/view/AcceptanceView.dart';

import '../../../../chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/response/ProtectedDealResponse.dart';
import '../../../../utils/Converter.dart';
import '../../../common/DealDateTimeWidget.dart';
import '../../../common/HomeInformationByDealWidget.dart';
import '../controller/DealRequestControllerByGetter.dart';
import '../widgets/DealRequestAgreeWidget.dart';
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
      appBar:
          CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeInformationByDealWidget(
                _chatDetailController.home.images!.first,
                _chatDetailController.home.address!,
                _chatDetailController.home.rent!,
                _chatDetailController.home.bond!),
            //거래 정보
            Center(
                child: DealPriceWidget(
              deposit: dealResponse!.deposit,
              fee: dealResponse!.fee, totalPrice: dealResponse.totalPrice,
            )),
            DealDateTimeWidget(ConverterUtil.formatDateTime(dealResponse.dealAt!)),
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
        height: 70.h,
        color: kWhiteColor,
        child: Row(
          children: [
            InkWell(
              onTap: () async {
                BeforeDepositCancelPopup()
                    .showPopup(dealId, _controller, context);
                //await _controller.cancelDealBeforeDeposit(dealId);
              },
              child: Container(
                margin: EdgeInsets.only(left: 15.w, bottom: 10.h),
                width: 100.w,
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: kGrey200Color),
                child:
                    Center(child: ButtonText("Cancel", kWhiteBackGroundColor)),
              ),
            ),
            InkWell(
              onTap: () async {
                if (_controller.canNext) {
                  Get.to(() => AcceptanceView(dealId, _chatDetailController,
                      _controller, dealResponse));
                }
              },
              child: Container(
                  margin: EdgeInsets.only(left: 15.w, bottom: 10.h),
                  width: 215.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: _controller.canNext ? kBlueColor : kGrey200Color,
                  ),
                  child: Center(
                    child: ButtonText("Accept", kWhiteColor),
                  )),
            ),
          ],
        )));
  }
}
