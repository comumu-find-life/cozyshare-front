import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/point/cash-out-view/view/CashOutView.dart';
import 'package:home_and_job/point/charge-point/main/view/ChargePointView.dart';

import '../controller/MyPointController.dart';

class MyPointHeader extends StatelessWidget {
  MyPointController _controller;


  MyPointHeader(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 370.w,
          height: 220.w,
          child: Column(
            children: [
              _buildMyPoint(),
              _buildAccountInformation(),
            ],
          ),
        ),
        _buildButtons(),
      ],
    );
  }

  Widget _buildAccountInformation(){
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
      color: kGrey200Color,
      width: 400.w,
      height: 45.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: FRegularText("BSB : ${_controller.userAccountResponse!.bsb}  ", kTextBlackColor, 13),
            ),
            Container(
              child: FRegularText(", Account Number : ${_controller.userAccountResponse!.accountNumber}", kTextBlackColor, 13),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMyPoint() {
    return Column(
      children: [
        Container(
          width: 80.w,
          child: Image.asset("assets/icons/point.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: FBoldText("Current My Point", kGrey700Color, 15),
        ),
        Container(
          margin: EdgeInsets.only(top: 26.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FBoldText("${_controller.userAccountResponse!.point}", kGrey700Color, 18),
              ),
              Container(
                child: Icon(Icons.attach_money),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Container(
      width: 350.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Get.to(() => CashOutView(_controller));
            },
            child: Container(
              width: 170.w,
              height: 50.h,
              decoration: BoxDecoration(
                // color: kPrimaryColor,
                  border: Border.all(color: kGrey600Color),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Center(
                child: FRegularText("Cash out", kGrey600Color, 14),
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Get.to(() => ChargePointView(_controller.userAccountResponse!));
            },
            child: Container(
              width: 170.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Center(
                child: FRegularText("Charge", kWhiteBackGroundColor, 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
