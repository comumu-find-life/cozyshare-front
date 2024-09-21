import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';
import 'package:home_and_job/rest-api/home-api/MyHomeApi.dart';
import 'package:home_and_job/my-profile/my-homes/main/widgets/SelectStatusWidget.dart';
import 'package:home_and_job/my-profile/my-homes/main/widgets/SellStopHomeWidget.dart';
import 'package:home_and_job/my-profile/my-homes/main/widgets/SoldOutHomeWidget.dart';

import '../../../../model/home/response/HomeOverviewResponse.dart';
import '../../../main/widgets/EmptyListWidget.dart';
import '../controller/MyHomeListController.dart';
import '../widgets/IntroduceProfileWidget.dart';
import '../widgets/SellHomeWidget.dart';

class MyHomeListView extends StatelessWidget {
  const MyHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    MyHomeListController _controller = MyHomeListController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
        appBar: CommonAppBar(
          canBack: true,
          color: kWhiteBackGroundColor,
          title: "",
        ),
        body: FutureBuilder(
          future: _controller.loadMyHomes(),
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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectStatusWidget(_controller),
                    //todo HomeOverviewResponse 로 대입
                    Obx(() => _controller.myHomes.length == 0
                        ? EmptyContainer()
                        : Container(
                            width: 380.w,
                            height: 710.h,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: _controller.myHomes.length,
                                itemBuilder: (BuildContext ctx, int idx) {
                                  return _controller.homeStatus ==
                                          HomeStatus.FOR_SALE
                                      ? SellHomeWidget(_controller.myHomes[idx], _controller)
                                      : _controller.homeStatus ==
                                              HomeStatus.SOLD_OUT
                                          ? SoldOutHomeWidget(
                                              _controller.myHomes[idx], _controller)
                                          : SellStopHomeWidget(
                                              _controller.myHomes[idx], _controller);
                                })))
                  ],
                ),
              );
            }
          },
        ));
  }



  Widget _buildEmptyHome() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 370.w,
        height: 660.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: kGrey200Color)),
        child: Center(
          child: FRegularText(
              "There are no registered house postings", kGrey300Color, 14),
        ),
      ),
    );
  }
}
