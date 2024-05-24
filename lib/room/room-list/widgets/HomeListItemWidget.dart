import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/response/HomeResponse.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class HomeListItemWidget extends StatelessWidget {
  final HomeResponse? home;

  HomeListItemWidget(this.home);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => RoomDetailView(home!));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        height: 160.h,
        width: 353.w,
        decoration: BoxDecoration(
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage("assets/images/test/home.png"),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: FBoldText(
                            "WAC 2000 멜버른 Street Name", kTextBlackColor, 14),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15.h),
                            child: FRegularText("\$3000/200", kGrey800Color, 13),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 17.h, left: 5.w),
                            child:
                            FRegularText("(bond/perweek)", kGrey600Color, 11),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: FRegularText("\$15", kGrey800Color, 13),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 13.h, left: 5.w),
                            child:
                            FRegularText("(Bill)", kGrey600Color, 11),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: FRegularText("Share House", kGrey600Color, 13),
                      )

                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 340.w,
              height: 1.h,
              color: kGrey200Color,
            )
          ],
        )
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      width: 130.w,
      height: 130.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
