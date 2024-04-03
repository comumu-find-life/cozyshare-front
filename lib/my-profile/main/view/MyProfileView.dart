

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/my-profile/main/widgets/ProviderListWidget.dart';
import 'package:home_and_job/my-profile/main/widgets/ProfileWidget.dart';

import '../controller/MyProfileController.dart';

class MyProfileView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    MyProfileController controller = MyProfileController();

    return Obx(() => Scaffold(
        backgroundColor: kGrey100Color,
       // appBar: CommonAppBar(canBack: false, title: '마이 프로필', color: kWhiteBackGroundColor,),
        body: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                width: 980.h,
                color: kWhiteBackGroundColor,
                height: 85.h,
                child: Container(
                  margin: EdgeInsets.only(left: 25.w,top: 45.h),
                  child: Title3Text("MyProfile", kTextBlackColor),
                ),
              ),
              ProfileWidget(controller),
              controller.isProvider?ProviderListWidget():Container()
            ],
          ),
        )
    ));
  }




}
