import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/home/home-detail/controller/HomeDetailController.dart';
import 'package:home_and_job/home/home-detail/widgets/HomeDetailAppbar.dart';
import 'package:home_and_job/home/home-detail/widgets/HomeDetailBottomBar.dart';
import 'package:home_and_job/home/home-detail/widgets/HomeHeaderWidget.dart';
import 'package:home_and_job/home/home-detail/widgets/HomeImagesWidget.dart';
import 'package:home_and_job/model/home/response/HomeResponse.dart';

import '../../../chatting/chat-detail/mode/User.dart';
import '../../../chatting/chat-detail/view/ChatDetailView.dart';
import '../../../constants/Fonts.dart';
import '../widgets/HomeOptionsWidget.dart';
import '../widgets/HomeOverViewWidget.dart';
import '../widgets/HomePriceWidget.dart';
import '../widgets/HomeProviderProfileWidget.dart';

class HomeDetailView extends StatelessWidget {
  HomeResponse home;


  HomeDetailView(this.home);

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
            HomeImagesWidget(),
            HomeHeaderWidget(),
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
            HomeProviderProfileWidget(),

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
