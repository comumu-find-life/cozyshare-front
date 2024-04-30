import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/charge-point/view/ChargePointView.dart';
import 'package:home_and_job/my-profile/my-homes/view/MyHomeListView.dart';

import '../../../common-widgets/button/ButtonWidgets.dart';
import '../../../register-home/view/RegisterHomeImageView.dart';
import '../../exchange-point/main/view/ExchangePointView.dart';

class ProviderListWidget extends StatelessWidget {
  const ProviderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 380.w,
      height: 280.h,
      color: kWhiteBackGroundColor,
      child: Column(
        children: [
          _myPostItem(),
          _registerMyHomeItem(),
          _myPoint(),
          _withDraw(),
        ],
      ),
    );
  }

  Widget _withDraw() {
    return InkWell(
      onTap: (){
        Get.to(() => ExchangePointView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(
                    Icons.currency_exchange,
                    color: kDarkBlue,
                    size: 17.sp,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Body2Text("출금 신청", kTextBlackColor),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 19.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _myPoint() {
    return InkWell(
      onTap: (){
        Get.to(() => ChargePointView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.green,
                    size: 17.sp,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Body2Text("포인트 충전", kTextBlackColor),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 19.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _myPostItem() {
    return InkWell(
      onTap: (){
        Get.to(() => MyHomeListView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(
                    Icons.bookmark,
                    color: kGrey800Color,
                    size: 17.sp,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7.w),
                  child: Body2Text("내 게시글 관리", kTextBlackColor),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 19.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _registerMyHomeItem() {
    return InkWell(
      onTap: () {
        Get.to(() => RegisterHomeImageView());
        //Get.to(() => RegisterHomeImageView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(
                    Icons.home_filled,
                    color: kBlueColor,
                    size: 17.sp,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Body2Text("내 집 내놓기", kTextBlackColor),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 19.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _registerMyJobItem() {
    return Container(
      width: 380.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 10.w, top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Icon(
                  Icons.work,
                  color: kGrey600Color,
                  size: 20.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Body2Text("직원 구인하기", kTextBlackColor),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 15.w, top: 15.h),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 19.sp,
            ),
          )
        ],
      ),
    );
  }
}
