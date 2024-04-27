
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/chatting/chat-detail/view/ChatDetailView.dart';
import 'package:home_and_job/home/home-detail/controller/HomeDetailController.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

Widget HomeDetailBottomBar(HomeDetailController _controller){
  return BottomAppBar(
    height: 90.h,
    color: kWhiteBackGroundColor,
    child: Center(
      child: InkWell(
        onTap: (){
          Get.to(() => ChatDetailView(currentUser));
        },
        child: Container(
          width: 330.w,
          height: 55.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: kBlueColor
          ),

          child: Center(child: ButtonText("문의하기", kWhiteBackGroundColor)),

        ),
      ),
    ),
  );
}