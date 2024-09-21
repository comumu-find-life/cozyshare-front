import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/protected-deal/deal-proceeding/provider/widgets/DealAccountByProviderWidget.dart';
import '../../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/enums/DealState.dart';
import '../../../../utils/Converter.dart';
import '../../../common/DealInformationWidgetByGetter.dart';
import '../../common/widgets/DealProcessWidget.dart';

class DealProcessViewByProvider extends StatelessWidget {
  int dealId;
  final ChatProviderDetailController _chatDetailController;

  DealProcessViewByProvider(this.dealId, this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    final dealResponse = _chatDetailController.getDealById(dealId);
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
            // Center(child: DealProcessWidget(step)),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 15.w),
              child: Title2Text("Transaction Status", kTextBlackColor),
            ),
            Center(
              child: DealProcessWidget(
                step: step,
                dealStartDateTime: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.dealStartDateTime),
                depositRequestDateTime: ConverterUtil().formatEnglishDateTime(
                    dealResponse!.depositRequestDateTime),
                depositCompletionDateTime: ConverterUtil()
                    .formatEnglishDateTime(
                        dealResponse!.depositCompletionDateTime),
                dealCompletionRequestDateTime: ConverterUtil()
                    .formatEnglishDateTime(
                        dealResponse!.dealCompletionRequestDateTime),
                dealCompletionDateTime: ConverterUtil().formatEnglishDateTime(
                    dealResponse!.dealCompletionDateTime),
                dealCancellationDateTime: ConverterUtil().formatEnglishDateTime(
                    dealResponse!.dealCancellationDateTime),
              ),
            ),
            Center(
                child: DealPriceWidget(
              deposit: dealResponse!.deposit,
              fee: dealResponse.fee,
            )),
            DealAccountByProviderWidget(dealResponse)
          ],
        ),
      ),
    );
  }

  int _getStep(DealState? dealState) {
    switch (dealState) {
      case DealState.REQUEST_DEPOSIT:
        return 1;
      case DealState.COMPLETE_DEPOSIT:
        return 2;
      default:
        return 3;
    }
  }
}
