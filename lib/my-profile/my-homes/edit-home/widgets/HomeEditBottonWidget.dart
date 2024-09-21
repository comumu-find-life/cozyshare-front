
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../controller/HomeEditController.dart';


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
      },
      child: FRegularText("Edit", kWhiteBackGroundColor, 16),
    ),
  );
}