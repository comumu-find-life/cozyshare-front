import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';
import 'package:home_and_job/my-profile/my-deals/cancel-detail/DealCancelView.dart';
import 'package:home_and_job/my-profile/my-deals/done-detail/view/DealDoneDetailView.dart';
import 'package:home_and_job/my-profile/my-deals/main/controller/MyDealListController.dart';
import 'package:home_and_job/my-profile/my-deals/main/widgets/CancelDealWidget.dart';
import 'package:home_and_job/my-profile/my-deals/main/widgets/DoneDealWidegt.dart';
import 'package:home_and_job/my-profile/my-deals/main/widgets/DuringDealWidget.dart';

import '../../../../constants/Fonts.dart';
import '../widgets/SelectDealTypeWidget.dart';

class MyDealListView extends StatelessWidget {
  const MyDealListView({super.key});

  @override
  Widget build(BuildContext context) {
    MyDealListController _controller = MyDealListController();
    return Scaffold(
        backgroundColor: kWhiteBackGroundColor,
        appBar: CommonAppBar(
          canBack: true,
          title: '',
          color: kWhiteBackGroundColor,
        ),
        body: FutureBuilder(
            future: _controller.loadInit(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Container(
                  child: Body2Text("Networ Error", kTextBlackColor),
                );
              } else {
                return Obx(() => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectDealTypeWidget(_controller),
                      if(_controller.dealStatus.isInProgressState())DuringDealWidget(_controller),
                      if(!_controller.dealStatus.isInProgressState())DoneDealWidget(_controller),
                      if(_controller.dealStatus == DealState.CANCEL_BEFORE_DEAL || _controller.dealStatus == DealState.CANCEL_DURING_DEAL)CancelDealWidget(_controller),
                    ],
                  ),
                ));
              }
            }));
  }
}
