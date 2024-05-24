import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';

import '../../../deal-generator/widgets/DealInformationHeaderWidget.dart';
import '../../getter/widgets/DealInformationWidgetByGetter.dart';
import '../widgets/DepositInformationWidgetByProvider.dart';

/**
 * Getter 에게 보여줄 입금 요청 View
 */
class DealRequestViewByProvider extends StatelessWidget {

  ChatDetailController _chatDetailController;


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
            DealInformationHeaderWidget(),
            //거래 정보
            Center(child: DealInformationWidgetByGetter()),
            //입금 계좌
            DepositInformationWidgetByProvider(),
            //이용약관 도으이
            Container(
              height: 130.h,
            )
          ],
        ),
      ),
    );
  }

}
