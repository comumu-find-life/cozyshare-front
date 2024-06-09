import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/charge-point/view/ChargePointView.dart';
import '../../../register-home/register-image/view/RegisterHomeImageView.dart';
import '../../../register-home/view/StartRegisyerView.dart';
import '../../exchange-point/main/view/ExchangePointView.dart';
import '../../my-homes/main/view/MyHomeListView.dart';

class ProviderListWidget extends StatelessWidget {
  const ProviderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.h),
        width: 355.w,
        height: 275.h,
        decoration: BoxDecoration(
          color: kWhiteBackGroundColor,
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _myPostItem(),
            _registerMyHomeItem(),
            _sellHistory(),
            _buyHistory(),
          ],
        ),
      ),
    );
  }


  Widget _myPostItem() {
    return InkWell(
      onTap: () {
        Get.to(() => MyHomeListView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w),
              child: FRegularText("My Rooms", kDarkBlue, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15.sp,
                color: kDarkBlue,
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
        Get.to(() => StartRegisterView());
        //Get.to(() => RegisterHomeImageView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w),
              child: FRegularText("Register My Room", kDarkBlue, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sellHistory() {
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
            Container(
              margin: EdgeInsets.only(left: 5.w),
              child: FRegularText("History of Sell Room", kDarkBlue, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buyHistory() {
    return InkWell(
      onTap: () {
        Get.to(() => StartRegisterView());
        //Get.to(() => RegisterHomeImageView());
      },
      child: Container(
        width: 380.w,
        height: 50.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w),
              child: FRegularText("History of buy Room", kDarkBlue, 15),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, top: 15.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: kDarkBlue,
                size: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

}
