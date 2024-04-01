

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/home/home-detail/view/HomeDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeMainController.dart';

class HomeListWidget extends StatelessWidget {
  HomeMainController controller;


  HomeListWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 365.w,
        height: 600.h,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 100,
            itemBuilder: (BuildContext ctx, int idx) {
              return _buildHomeItem();
            }));
  }

  Widget _buildHomeItem() {
    return InkWell(
      onTap: () {
        Get.to(() => HomeDetailView());
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        height: 150.h,
        width: 350.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 1.5,
                spreadRadius: 1.0,
                offset: const Offset(0, 1),
              )
            ]),
        child: Row(
          children: [
            Container(
                width: 100.w,
                height: 140.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/test/home.png",
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: HelperText("one room", kTextBlackColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Title3Text("address here", kTextBlackColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child:
                    Body2Text("46.44 m - 2 floor", kGrey800Color),
                  ),
                  Container(
                    width: 250.w,
                    margin: EdgeInsets.only(top: 5.h),
                    child: Body2Text(
                        "this room is clean! and near by subway",
                        kTextBlackColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
