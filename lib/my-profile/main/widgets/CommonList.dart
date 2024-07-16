
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../constants/Colors.dart';
import '../../my-deals/main/view/MyDealListView.dart';
import '../../my-friends/view/MyFriendView.dart';
import '../../my-homes/main/view/MyHomeListView.dart';

class CommonList extends StatelessWidget {
  const CommonList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        height: 120.h,
        decoration: BoxDecoration(
            color: kWhiteBackGroundColor,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMyRooms(),
              _buildProtectedDeal(),
              _buildMyFriends(),
            //  _buildCustomerCenter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProtectedDeal() {
    return InkWell(
      onTap: (){
        Get.to(() => MyDealListView());
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: kGrey100Color,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Container(
                decoration: BoxDecoration(
                    // color: kPrimaryColor,
                    // shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.health_and_safety_rounded, color: kTextBlackColor,size: 29.sp,),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h,left: 0.w),
              child: Center(
                child: FRegularText("My Deals", kTextBlackColor, 14),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildMyRooms() {
    return InkWell(

      onTap: (){
        Get.to(() => MyHomeListView());
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: kGrey100Color,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Container(
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  // shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.home_filled, color: kTextBlackColor,size: 29.sp,),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h,left: 0.w),
              child: Center(
                child: FRegularText("My Rooms", kTextBlackColor, 14),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMyFriends() {
    return InkWell(
      onTap: (){
        Get.to(() => MyFriendView());
      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: kGrey100Color,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Container(
                decoration: BoxDecoration(
                  // color: kPrimaryColor,
                  // shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.people, color: kTextBlackColor,size: 29.sp,),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h,left: 0.w),
              child: Center(
                child: FRegularText("Friends", kTextBlackColor, 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
