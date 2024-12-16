
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/account/login/view/MainLoginView.dart';
import 'package:home_and_job/utils/DiskDatabase.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/HomeDetailController.dart';

Widget HomeDetailBottomBar(HomeDetailController _controller, BuildContext context){
  return Container(
    height: 70.h,
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
        String? userId = await DiskDatabase().getUserId();
        if(_controller.homeInformationResponse?.providerId != userId){
          _controller.sendMessage(context);
        }else{
          CustomSnackBar().show(context, "자신의 게시물에 메시지를 보낼 수 없습니다.");
        }
      },
      child: FRegularText("Send Message", kWhiteBackGroundColor, 16),
    ),
  );
}