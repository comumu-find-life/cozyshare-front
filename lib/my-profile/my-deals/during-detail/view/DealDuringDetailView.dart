import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealResponse.dart';
import 'package:home_and_job/my-profile/my-deals/widgets/DealPaymentInformationWidget.dart';
import '../../widgets/DealRoomInformationWidget.dart';

/**
 * 현재 진행 중인 거래 정보 조회 View
 */
class DealDuringDetailView extends StatelessWidget {
  ProtectedDealResponse dealResponse;


  DealDuringDetailView(this.dealResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: kWhiteBackGroundColor,
      ),
      bottomSheet: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              // child: DealProcessWidget(
              //   step: dealResponse.dealState.getStep(),
              //   dealStartDateTime: ConverterUtil()
              //       .formatEnglishDateTime(dealResponse!.dealStartDateTime),
              //   depositRequestDateTime: ConverterUtil().formatEnglishDateTime(
              //       dealResponse!.depositRequestDateTime),
              //   depositCompletionDateTime: ConverterUtil()
              //       .formatEnglishDateTime(
              //       dealResponse!.depositCompletionDateTime),
              //   dealCompletionRequestDateTime: ConverterUtil()
              //       .formatEnglishDateTime(
              //       dealResponse!.dealCompletionRequestDateTime),
              //   dealCompletionDateTime: ConverterUtil().formatEnglishDateTime(
              //       dealResponse!.dealCompletionDateTime),
              //   dealCancellationDateTime: ConverterUtil().formatEnglishDateTime(
              //       dealResponse!.dealCancellationDateTime),
              // ),
            ),
            DealPaymentInformationWidget(dealResponse),
            DealRoomInformationWidget(dealResponse),
            Container(
              color: kWhiteBackGroundColor,
              height: 150.h,
            )
          ],
        ),
      ),
    );
  }


}
