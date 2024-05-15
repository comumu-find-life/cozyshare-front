
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/chatting/chat-detail/view/ChatDetailView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeDetailController.dart';

Widget HomeDetailBottomBar(HomeDetailController _controller){
  return Container(
    width: double.infinity,
    color: kBlueColor,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
        kBlueColor,
        //padding: EdgeInsets.symmetric(vertical: 14),
        side: BorderSide.none, // 테두리 없애기
        shadowColor: Colors.transparent, // 그림자 없애기
      ),
      onPressed: () {
        Get.to(() => ChatDetailView(currentUser));
        //_controller.ontapStep1Next();
        //_controller.canFinish ? Navigator.pop(context) : null;
      },
      child: FRegularText("Send Message", kWhiteBackGroundColor, 16),
    ),
  );
}