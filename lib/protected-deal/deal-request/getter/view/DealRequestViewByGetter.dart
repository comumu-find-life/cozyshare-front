import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';

import '../../../../chatting/chat-detail-getter/controller/ChatProviderDetailController.dart';
import '../../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../deal-generator/widgets/DealInformationHeaderWidget.dart';
import '../controller/DealRequestControllerByGetter.dart';
import '../widgets/DealRequestAgreeWidget.dart';
import '../widgets/DepositInformationWidgetByGetter.dart';
import '../../../common/DealInformationWidgetByGetter.dart';

/**
 * Getter 에게 보여줄 입금 요청 View
 */
class DealRequestViewByGetter extends StatelessWidget {

  ChatGetterDetailController _chatDetailController;
  DealRequestControllerByGetter _controller =
      DealRequestControllerByGetter();


  DealRequestViewByGetter(this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    bool _canRequestDeposit = _chatDetailController.dealResponse!.dealState == DealState.BEFORE_DEPOSIT?true: false;
    return Scaffold(
      bottomSheet: _canRequestDeposit?_buildStepOneButton(context):null,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                 DealInformationHeaderWidget(_chatDetailController.home),
            //거래 정보
            Center(child: DealPriceWidget(deposit: _chatDetailController.dealResponse!.deposit, fee: _chatDetailController.dealResponse!.fee,)),
            //입금 계좌
            DepositInformationWidgetByGetter(_chatDetailController.dealResponse!),
            //이용약관 도으이
            if(_canRequestDeposit) DealRequestAgreeWidget(controller: _controller),
            Container(
              height: 130.h,
            )
          ],
        ),
      ),
    );
  }

  Obx _buildStepOneButton(BuildContext context) {
    return Obx(() => Container(
      width: double.infinity,
      color: _controller.canNext ? kBlueColor : kGrey200Color,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _controller.canNext ? kBlueColor : kGrey200Color,
          //padding: EdgeInsets.symmetric(vertical: 14),
          side: BorderSide.none, // 테두리 없애기
          shadowColor: Colors.transparent, // 그림자 없애기
        ),
        onPressed: () async{
          if(_controller.canNext){
            await _controller.requestDeposit(_chatDetailController.dealResponse!.id);
             _chatDetailController.applyDeposit();
            Navigator.pop(context);
          }
        },
        child: ButtonText("입금 신청", kWhiteBackGroundColor),
      ),
    ));
  }
}
