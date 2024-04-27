

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/home/home-detail/view/HomeDetailView.dart';
import 'package:home_and_job/model/home/response/HomeResponse.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeMainController.dart';

class HomeListWidget extends StatelessWidget {
  HomeMainController controller;


  HomeListWidget(this.controller);

  @override
  Widget build(BuildContext context) {

    List<HomeResponse> homes = [homeResponseTest1,homeResponseTest2,homeResponseTest3,homeResponseTest4,homeResponseTest5];
    return Container(
        width: 365.w,
        height: 600.h,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: homes.length,
            itemBuilder: (BuildContext ctx, int idx) {
              return _buildHomeItem(homes[idx]);
            }));
  }

  Widget _buildHomeItem(HomeResponse homeResponse) {
    return InkWell(
      onTap: () {
        Get.to(() => HomeDetailView(homeResponse));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        height: 160.h,
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
                    width: 250.w
                    ,
                    margin: EdgeInsets.only(top: 15.h),
                    child: Title3Text("WAC 2000 멜버른 Street Name", kTextBlackColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child:
                    Body2Text("보증금 : 2000\$", kGrey800Color),
                  ),
                  Container(
                    width: 250.w,
                    margin: EdgeInsets.only(top: 5.h),
                    child: Body2Text(
                        "주세 : 200\$",
                        kTextBlackColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15.w,top: 10.h),
                    width: 130.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: kDarkBlue
                    ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(Icons.verified_user,color: kWhiteBackGroundColor,),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 10.w, left: 5.w),
                            child: Body2Text("안전거래", kWhiteBackGroundColor)),
                      ],
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
