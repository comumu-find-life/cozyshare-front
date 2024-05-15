import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/home/response/HomeResponse.dart';

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
  HomeResponse home;


  RoomDetailView(this.home);

  @override
  Widget build(BuildContext context) {
    HomeDetailController _controller = HomeDetailController(home.id);
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: HomeDetailBottomBar(_controller),
      appBar: HomeDetailAppbar(_controller, home.id, context),
      //bottomNavigationBar: HomeDetailBottomBar(_controller),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeProviderProfileWidget(),
            HomeImagesWidget(),
            HomeHeaderWidget(home),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              width: 380.w,
              height: 1.h,
              color: kGrey200Color,
            ),
            HomePriceWidget(),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              width: 380.w,
              height: 1.h,
              color: kGrey200Color,
            ),


            HomeOverViewWidget(),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              width: 380.w,
              height: 1.h,
              color: kGrey200Color,
            ),
            HomeOptionsWidget(),
          ],
        ),
      ),
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
