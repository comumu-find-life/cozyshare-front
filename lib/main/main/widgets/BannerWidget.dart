import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/main/main/controller/MainController.dart';
import 'package:home_and_job/procted-deal-guild/view/ProctedDealGuidView.dart';

class BannerWidget extends StatefulWidget {
  final MainController mainController;

  BannerWidget(this.mainController);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: SizedBox(
        height: 75.h,

        width: 320.w,// 배너 높이 조절
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: [
            _buildProtectedDealBanner(),

            // Container(
            //   margin: EdgeInsets.only(right: 10.w),
            //   width: 200.w,
            //   height: 100.h,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       color: kGrey200Color
            //   ),
            //   child: Center(
            //     child: Body2Text("광고 배너", kWhiteBackGroundColor),
            //   ),
            //
            // ),
            //
            // Container(
            //   margin: EdgeInsets.only(right: 10.w),
            //   width: 200.w,
            //   height: 100.h,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       color: kGrey300Color
            //   ),
            //   child: Center(
            //     child: Body2Text("광고 배너", kWhiteBackGroundColor),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildProtectedDealBanner(){
    return InkWell(
      onTap: (){
        Get.to(() => ProctedDealGuide());
      },
      child: Container(
          margin: EdgeInsets.only(right: 10.w),

          width: 200.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: kBlueColor
          ),

          child: Row(
            children: [
              Container(
                width: 90.w,
                height: 50.h,
                child: Image.asset("assets/icons/deal_icon.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Body1Text("안전거래란?", kWhiteBackGroundColor),
                    ),
                    Container(
                      child: Body2Text("보증금 사기 걱정없는 언전거래!", kWhiteBackGroundColor),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
