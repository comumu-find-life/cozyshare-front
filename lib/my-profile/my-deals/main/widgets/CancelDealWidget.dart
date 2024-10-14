import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/my-profile/my-deals/cancel-detail/DealCancelView.dart';
import 'package:home_and_job/my-profile/my-deals/during-detail/view/DealDuringDetailView.dart';
import 'package:home_and_job/utils/Converter.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/response/ProtectedDealResponse.dart';
import '../../../main/widgets/EmptyListWidget.dart';
import '../controller/MyDealListController.dart';

class CancelDealWidget extends StatelessWidget {
  MyDealListController _controller;

  CancelDealWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return _controller.cancelDeals.length == 0
        ? EmptyContainer()
        : Container(
            width: 380.w,
            height: 710.h,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _controller.cancelDeals.length,
                itemBuilder: (BuildContext ctx, int idx) {
                  return _buildDealWidget(_controller.cancelDeals[idx]);
                }));
  }

  Widget _buildDealWidget(ProtectedDealResponse myProtectedDealResponse) {
    return InkWell(
      onTap: () {
        Get.to(() => DealDuringDetailView(myProtectedDealResponse));
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
                _buildDate(myProtectedDealResponse),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: 330.w,
                  height: 1.h,
                  color: kGrey300Color,
                ),
                _buildBody(myProtectedDealResponse),
                InkWell(
                  onTap: () {
                    Get.to(() => DealCancelDetailView(myProtectedDealResponse));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    width: 320.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Center(
                      child:
                          FBoldText("Detailed Information", kPrimaryColor, 14),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _buildBody(ProtectedDealResponse myProtectedDealResponse) {
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
                _buildAddress(myProtectedDealResponse),
                _buildPrice(myProtectedDealResponse),
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
                child:
                    FBoldText("Transaction in progress", kTextBlackColor, 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrice(ProtectedDealResponse myProtectedDealResponse) {
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
                child: FRegularText(
                    "Deposit \$${myProtectedDealResponse.deposit}",
                    kTextBlackColor,
                    14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDate(ProtectedDealResponse myProtectedDealResponse) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 13.w, right: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.h),
            width: 200.w,
            child: FBoldText(
                "${ConverterUtil().formatEnglishDateTime(myProtectedDealResponse.createAt)}",
                kTextBlackColor,
                14),
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

  Widget _buildAddress(ProtectedDealResponse myProtectedDealResponse) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 200.w,
      child:
          FBoldText("${myProtectedDealResponse.address}", kTextBlackColor, 14),
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
