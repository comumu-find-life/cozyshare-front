import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealResponse.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/enums/DealState.dart';
import '../../../../protected-deal/deal-request/getter/widgets/DepositInformationWidgetByGetter.dart';
import '../../../deal-request/getter/widgets/DealInformationWidgetByGetter.dart';
import '../../common/widgets/DealProcessWidget.dart';
import '../../common/widgets/DepositGuideWidget.dart';

class DealProcessViewByProvider extends StatelessWidget {
  final ChatDetailController _chatDetailController;

  DealProcessViewByProvider(this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    final dealResponse = _chatDetailController.dealResponse;
    final step = _getStep(dealResponse?.dealState);

    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        canBack: true,
        title: "",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(child: DealProcessWidget(step)),
            InkWell(
                onTap: (){
                  print(step);
                },
                child: Center(child: DealInformationWidgetByGetter(_chatDetailController.dealResponse!))),
          ],
        ),
      ),
    );
  }

  int _getStep(DealState? dealState) {
    switch (dealState) {
      case DealState.DURING_DEPOSIT:
        return 1;
      case DealState.DONE_DEPOSIT:
        return 2;
      default:
        return 3;
    }
  }

  Container _buildStepOneButton(BuildContext context, int step) {
    final isFinishable = step == 2 ? true : false;
    return Container(
      width: double.infinity,
      color: isFinishable ? kBlueColor : kGrey200Color,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFinishable ? kBlueColor : kGrey200Color,
          side: BorderSide.none,
          shadowColor: Colors.transparent,
        ),
        onPressed:
        isFinishable ? () => _onFinishButtonPressed(context) : null,
        child: ButtonText("거래 확정", kWhiteBackGroundColor),
      ),
    );
  }

  void _onFinishButtonPressed(BuildContext context) {
    _chatDetailController.confirmDeal();
    Navigator.pop(context);
  }
}
