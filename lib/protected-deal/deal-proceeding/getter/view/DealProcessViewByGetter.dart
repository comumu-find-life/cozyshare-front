import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';
import 'package:home_and_job/utils/Converter.dart';
import 'package:home_and_job/utils/SnackBar.dart';
import '../../../../chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import '../../../../chatting/chat-detail-provider/controller/ChatProviderDetailController.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/enums/DealState.dart';
import '../../../../protected-deal/deal-request/getter/widgets/DepositInformationWidgetByGetter.dart';
import '../../../common/DealInformationWidgetByGetter.dart';
import '../../../common/HomeInformationByDealWidget.dart';
import '../controller/DealProcessControllerByGetter.dart';
import '../widgets/DealFinishAgreeWidget.dart';
import '../../common/widgets/DealProcessWidget.dart';
import '../../common/widgets/DepositGuideWidget.dart';

class DealProcessViewByGetter extends StatelessWidget {
  final int dealId;
  final ChatGetterDetailController _chatDetailController;
  final DealProcessControllerByGetter _controller =
      DealProcessControllerByGetter();

  DealProcessViewByGetter(this.dealId, this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    final dealResponse = _chatDetailController.getDealById(dealId);
    final step = dealResponse?.dealState.getStep();
    //final step = _getStep(dealResponse?.dealState);

    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: Obx(() => _filterButton(step!, context),),
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
            Container(
              margin: EdgeInsets.only(top: 30.h, left: 15.w),
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

            Center(
                child: DealPriceWidget(
              deposit: dealResponse!.deposit,
              fee: dealResponse.fee,
            )),
            if (step == 2) DealFinishAgreeWidget(_controller),
            SizedBox(height: 100.h,)
          ],
        ),
      ),
    );
  }

  Container _filterButton(int step, BuildContext context) {
    switch (step) {
      case 2:
        return _buildRequestCompleteRequestButton(context);
      default:
        return Container(
          height: 1.h,
        );
    }
  }

  Container _buildNotTapButton(String text) {
    return Container(
      width: double.infinity,
      color: kGrey200Color,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kGrey200Color,
          side: BorderSide.none,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {},
        child: ButtonText("${text}", kWhiteBackGroundColor),
      ),
    );
  }

  Container _buildRequestCompleteRequestButton(BuildContext context) {
    return _controller.canFinish
        ? Container(
            width: double.infinity,
            color: kPrimaryColor,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                side: BorderSide.none,
                shadowColor: Colors.transparent,
              ),
              onPressed: () async {
                var bool = await ProtectedDealApi().completeDeal(dealId);
                if(bool){
                  _chatDetailController.completeDeal(dealId);
                }else{
                  CustomSnackBar().show(context, "failed");
                }

                Navigator.pop(context);
              },
              child: ButtonText("Transaction Complete!", kWhiteBackGroundColor),
            ),
          )
        : Container(
            width: double.infinity,
            color: kGrey200Color,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kGrey200Color,
                side: BorderSide.none,
                shadowColor: Colors.transparent,
              ),
              onPressed: () async {},
              child: ButtonText("Transaction Complete!", kWhiteBackGroundColor),
            ),
          );
  }
}
