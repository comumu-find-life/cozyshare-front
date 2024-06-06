import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/detail-profile/view/ProfileDetailView.dart';
import 'package:home_and_job/room/room-detail/controller/HomeDetailController.dart';

import '../../../constants/Colors.dart';

class HomeProviderProfileWidget extends StatelessWidget {
  HomeDetailController _controller;


  HomeProviderProfileWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(() => ProfileDetailView(int.parse(_controller.homeInformationResponse!.providerId!)));
      },
      child: Container(
        width: 360.w,
        height: 50.h,
        decoration: BoxDecoration(),
        margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
             children: [
               Container(
                 child: CircleAvatar(
                   backgroundColor: kGrey200Color,
                   backgroundImage: AssetImage("assets/images/test/man.png"),
                 ),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     margin: EdgeInsets.only(left: 10.w, top: 10.h),
                     child: FRegularText("${_controller.homeInformationResponse!.providerName}", kGrey800Color, 16),
                   ),
                 ],
               ),
             ],
           ),
            Container(
              margin: EdgeInsets.only(bottom: 7.h,right: 20.w),
              child: Icon(Icons.arrow_forward_ios_sharp, size: 15.sp,),
            )
          ],
        ),
      ),
    );
  }
}
