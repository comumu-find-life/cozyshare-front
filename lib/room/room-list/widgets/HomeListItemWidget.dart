import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/home/enums/HomeType.dart';
import 'package:home_and_job/model/home/response/HomeOverviewResponse.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class HomeListItemWidget extends StatelessWidget {
  final HomeOverviewResponse? home;

  HomeListItemWidget(this.home);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => RoomDetailView(home!.id, false));
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
                          width: 210.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: FBoldText(
                              "${home!.address}", kTextBlackColor, 14),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.h),
                              child: FRegularText(
                                  "\$${home!.bond}/${home!.rent}",
                                  kGrey800Color,
                                  13),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 17.h, left: 5.w),
                              child: FRegularText(
                                  "(bond/perweek)", kGrey600Color, 11),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            home!.bill == 0
                                ? Container(
                                    margin: EdgeInsets.only(top: 10.h),
                                    child:
                                        FRegularText("free", kGrey800Color, 13),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: FRegularText(
                                        "\$${home!.bill}", kGrey800Color, 13),
                                  ),
                            Container(
                              margin: EdgeInsets.only(top: 13.h, left: 5.w),
                              child: FRegularText("(Bill)", kGrey600Color, 11),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: FRegularText("${home!.type.value}", kGrey600Color, 13),
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
          )),
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
