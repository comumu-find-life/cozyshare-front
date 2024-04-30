import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/ExchangeController.dart';

class SeleteTypeWidget extends StatelessWidget {
  ExchangeController _controller;

  SeleteTypeWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Obx(() => Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _controller.ontapType(0);
                  },
                  child: Column(
                    children: [
                      Container(
                        child: Body2Text(
                            "거래 내역",
                            _controller.selectType == 0
                                ? kGrey700Color
                                : kGrey300Color),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        width: screenWidth/2,
                        height: 1.3.h,
                        color: _controller.selectType == 0 ? kBlueColor : null,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _controller.ontapType(1);
                  },
                  child: Column(
                    children: [
                      Container(
                        child: Body2Text(
                            "출금 내역",
                            _controller.selectType == 1
                                ? kGrey700Color
                                : kGrey300Color),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        width: screenWidth/2,
                        height: 1.3.h,
                        color: _controller.selectType == 1 ? kBlueColor : null,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}
