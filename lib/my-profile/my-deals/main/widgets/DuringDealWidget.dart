import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/my-profile/my-deals/during-detail/view/DealDuringDetailView.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/popup/AskSoldOutPopup.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/view/HomeEditView.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';

class DuringDealWidget extends StatelessWidget {
  DuringDealWidget();

  //todo soldout 팝업
  //AskSoldOutPopup().showDialog(_controller, context);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Get.to(() => MyHomeDetailView(home.id));
      },
      child: Center(
        child: Container(
            margin: EdgeInsets.only(top: 10.h),
            height: 290.h,
            width: 350.w,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: kGrey300Color)),
            child: Column(
              children: [
                _buildDate(),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: 330.w,
                  height: 1.h,
                  color: kGrey300Color,
                ),
                _buildBody(),
                InkWell(
                  onTap: (){
                    Get.to(() =>DealDuringDetailView());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    width: 320.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                    child: Center(
                      child: FBoldText("Detailed Information", kPrimaryColor, 14),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          _buildImage(),
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildState(),
                _buildAddress(),
                _buildPrice(),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildState() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            //top: BorderSide(color: kGrey200Color)
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.h),
                height: 20.h,
                child: FBoldText("Transaction in progress", kTextBlackColor, 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              //top: BorderSide(color: kGrey200Color)
              )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.h),
                width: 130.w,
                height: 20.h,
                child: FRegularText("Deposit \$2000", kTextBlackColor, 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDate() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 13.w, right: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.h),
            width: 200.w,
            child: FBoldText("2024.10.31", kTextBlackColor, 14),
          ),
          Container(
            // child: Icon(
            //   Icons.arrow_forward_ios,
            //   size: 14.sp,
            // ),
          )
        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 200.w,
      child: FBoldText("Address", kTextBlackColor, 14),
    );
  }

  Widget _buildImage() {
    return Container(
      margin: EdgeInsets.only(left: 13.w),
      width: 120.w,
      height: 120.h,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Image.asset(
            "assets/images/test/home.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
