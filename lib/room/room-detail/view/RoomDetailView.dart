import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';

import '../controller/HomeDetailController.dart';
import '../widgets/HomeDetailAppbar.dart';
import '../widgets/HomeDetailBottomBar.dart';
import '../widgets/HomeHeaderWidget.dart';
import '../widgets/HomeImagesWidget.dart';
import '../widgets/HomeOptionsWidget.dart';
import '../widgets/HomeOverViewWidget.dart';
import '../widgets/HomePriceWidget.dart';
import '../widgets/HomeProviderProfileWidget.dart';

class RoomDetailView extends StatelessWidget {
  final int homeIdx;

  RoomDetailView(this.homeIdx);

  @override
  Widget build(BuildContext context) {
    HomeDetailController _controller = HomeDetailController();
    return FutureBuilder(
      future: _controller.loadHomeInformation(homeIdx),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Body2Text("Error", kTextBlackColor),

          );
        } else {
          return Scaffold(
            backgroundColor: kWhiteBackGroundColor,
            bottomSheet: HomeDetailBottomBar(_controller),
            appBar: HomeDetailAppbar(_controller,
                _controller.homeInformationResponse!.homeId, context),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeProviderProfileWidget(_controller),
                  HomeImagesWidget(_controller),
                  HomeHeaderWidget(_controller.homeInformationResponse!),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    width: 380.w,
                    height: 1.h,
                    color: kGrey200Color,
                  ),
                  HomePriceWidget(_controller.homeInformationResponse!),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    width: 380.w,
                    height: 1.h,
                    color: kGrey200Color,
                  ),
                  HomeOverViewWidget(_controller),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    width: 380.w,
                    height: 1.h,
                    color: kGrey200Color,
                  ),
                  HomeOptionsWidget(_controller.homeInformationResponse!),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kWhiteBackGroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          Obx(() => Container(
            child: Icon(Icons.favorite_border),
          ))
        ],
      ),
    );
  }
}
