
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../search-map/main/view/MainSearchView.dart';
import '../controller/MainController.dart';

class MainSearchBar extends StatelessWidget {

  MainController controller;

  MainSearchBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      width: 340.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: InkWell(
        onTap: (){

          //Get.to(() => MapSample(), transition: Transition.upToDown);
           Get.to(() => MainSearchView(), transition: Transition.upToDown);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
                child: Body2Text("Search Room", kGrey400Color)),
            Container(
                margin: EdgeInsets.only(right: 15.w),
                child: Icon(Icons.search))
          ],
        ),
      )

    );
  }
}
