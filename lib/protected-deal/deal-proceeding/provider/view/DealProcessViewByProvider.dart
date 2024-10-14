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
import '../../../common/HomeInformationByDealWidget.dart';
import '../../common/widgets/DealProcessWidget.dart';

class DealProcessViewByProvider extends StatelessWidget {
  int dealId;
  final ChatProviderDetailController _chatDetailController;

  DealProcessViewByProvider(this.dealId, this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    final dealResponse = _chatDetailController.getDealById(dealId);
    final step = dealResponse?.dealState.getStep();

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
            HomeInformationByDealWidget(_chatDetailController.home.images!.first, _chatDetailController.home.address!, _chatDetailController.home.rent!, _chatDetailController.home.bond!),
            // Center(child: DealProcessWidget(step)),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 15.w),
              child: Title2Text("Transaction Status", kTextBlackColor),
            ),
            Center(
              child: DealProcessWidget(
                step: step!,
                createAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.createAt),
                startAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.startAt),
                cancelAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.cancelAt),
                completeAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.completeAt),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
                child: DealPriceWidget(
              deposit: dealResponse!.deposit,
              fee: dealResponse.fee,
            )),
            // Container(
            //   width: 150.w,
            //   child: Image.asset("assets/icons/deal_image.png"),
            // )
          ],
        ),
      ),
    );
  }
}
