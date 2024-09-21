import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/view/HomeEditView.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../detail-view/view/MyHomeDetailView.dart';
import '../controller/MyHomeListController.dart';


class SellStopHomeWidget extends StatelessWidget {
  final HomeOverviewResponse home;
  final MyHomeListController _controller;
  SellStopHomeWidget(this.home, this._controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 150.h,
          width: 380.w,
          decoration: BoxDecoration(
            color: kWhiteColor,
            border: Border(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          child: Row(
            children: [
              _buildImage(),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAddress(),
                    _buildPrice(),
                    InkWell(
                      onTap: (){
                        //_controller.reUploadHome(home.id);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 17.h),
                        width: 203.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: kGrey300Color),
                            color: kGrey100Color,
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        child: Center(
                          child: Body2Text("Upload", kGrey700Color),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _buildPrice() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            //top: BorderSide(color: kGrey200Color)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h),
                width: 100.w,
                height: 20.h,
                child: FRegularText("Bond \$${home.bond}", kGrey700Color, 14),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                width: 100.w,
                height: 20.h,
                child: FRegularText("Rent \$${home.rent}", kGrey700Color, 14),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 200.w,
      child: FBoldText("${home.address}", kGrey700Color, 15),
    );
  }

  Widget _buildImage() {
    return Container(
      margin: EdgeInsets.only(left: 13.w),
      width: 100.w,
      height: 125.h,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Image.asset(
            "assets/images/test/home.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
