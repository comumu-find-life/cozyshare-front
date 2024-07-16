import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/controller/HomeEditController.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/view/HomeEditAddressView.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';


class HomeEditAddressWidget extends StatelessWidget {
  HomeEditController _controller;


  HomeEditAddressWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: EdgeInsets.only(left: 15.w, top: 30.h),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FBoldText("Address", kTextBlackColor, 16),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: FRegularText("${_controller.homeAddress}", kTextBlackColor, 15),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(() => HomeEditAddressView(_controller));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20.h, left: 20.w),
                      child: Icon(Icons.edit),
                    ),
                  )
                ],)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
