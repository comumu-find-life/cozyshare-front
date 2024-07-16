

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/enums/HomeStatus.dart';

import '../controller/MyHomeListController.dart';

class SelectStatusWidget extends StatelessWidget {
  MyHomeListController _controller;



  SelectStatusWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: 310.w,
      margin: EdgeInsets.only(top: 20.h, left: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSellButton(),
          _buildSoldOutButton(),
          _buildSellStopButton(),
        ],
      ),
    ));
  }

  Widget _buildSellButton(){
    return InkWell(
      onTap: (){
        _controller.onTapHomeStatus(HomeStatus.FOR_SALE);
      },
      child: Container(
        width: 100.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _controller.homeStatus== HomeStatus.FOR_SALE ? kTextBlackColor : kWhiteBackGroundColor,
          border: Border.all(color: kGrey300Color),
        ),
        child: Center(
          child: FRegularText("Sell", _controller.homeStatus== HomeStatus.FOR_SALE ? kWhiteBackGroundColor : kGrey500Color, 14),
        ),
      ),
    );
  }

  Widget _buildSoldOutButton(){
    return InkWell(
      onTap: (){
        _controller.onTapHomeStatus(HomeStatus.SOLD_OUT);
      },
      child: Container(
        width: 100.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _controller.homeStatus== HomeStatus.SOLD_OUT ? kTextBlackColor : kWhiteBackGroundColor,
          border: Border.all(color: kGrey300Color),
        ),
        child: Center(
          child: FRegularText("Sold Out", _controller.homeStatus== HomeStatus.SOLD_OUT ? kWhiteBackGroundColor : kGrey500Color, 14),
        ),
      ),
    );
  }

  Widget _buildSellStopButton(){
    return InkWell(
      onTap: (){
        _controller.onTapHomeStatus(HomeStatus.SELL_STOP);
      },
      child: Container(
        width: 100.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _controller.homeStatus== HomeStatus.SELL_STOP ? kTextBlackColor : kWhiteBackGroundColor,
          border: Border.all(color: kGrey300Color),
        ),
        child: Center(
          child: FRegularText("Sell Stop", _controller.homeStatus== HomeStatus.SELL_STOP ? kWhiteBackGroundColor : kGrey500Color, 14),
        ),
      ),
    );
  }
}
