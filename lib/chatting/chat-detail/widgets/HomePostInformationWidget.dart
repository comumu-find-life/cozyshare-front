 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/room/room-detail/view/RoomDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/home/response/HomeOverviewResponse.dart';

 /**
  * 채팅방 상단에 보여줄 거래 매물 정보 위젯
  */
 Widget HomePostInformationWidget(){
  return Container(
    width: 380.w,
    height: 70.h,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      color: kWhiteBackGroundColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHomeInformation(),
        _buildMapIcon(),
      ],
    ),
  );
}

Widget _buildMapIcon(){
  return InkWell(
    onTap: (){
      print("mapp");
    },
    child: Container(
      margin: EdgeInsets.only(right: 10.w),
      child: Icon(
        Icons.location_on_sharp,
        color: kChatPrimaryColor,
      ),
    ),
  );
}

Widget _buildHomeInformation(){
  return InkWell(
    onTap: (){
      Get.to(() => RoomDetailView(null));
    },
    child: Row(
      children: [
        Container(
            margin: EdgeInsets.only(left: 10.w),
            width: 85.w,
            height: 60.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/test/home.png",
                fit: BoxFit.cover,
              ),
            )),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Body2Text("WAC Melbulan", kTextBlackColor),
              ),
              Container(
                margin: EdgeInsets.only(top: 6.h),
                child: HelperText("보증금:3000", kGrey600Color),
              )
            ],
          ),
        ),
      ],
    ),
  );
}