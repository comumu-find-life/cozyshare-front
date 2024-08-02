
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail/mode/User.dart';
import 'package:home_and_job/chatting/chat-detail/view/ChatDetailView.dart';
import 'package:home_and_job/my-profile/my-homes/main/view/MyHomeListView.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../controller/HomeEditController.dart';
import '../popup/AskSoldOutPopup.dart';


Widget HomeEditBottomWidget(HomeEditController _controller, BuildContext context){
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
      onPressed: () async{
        _controller.updateHomeInformation();
        // await _controller.soldOut();
        // Navigator.pop(context);
        // Get.to(() => MyHomeListView());
        //
      },
      child: FRegularText("Edit", kWhiteBackGroundColor, 16),
    ),
  );
}