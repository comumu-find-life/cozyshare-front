
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/MainController.dart';

class MainSearchBar extends StatelessWidget {

  MainController controller;

  MainSearchBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 340.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: kGrey200Color,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: InkWell(
        onTap: (){
          print("move search");

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
                child: Body2Text("검색어를 입력해 보세요.", kGrey400Color)),
            Container(
                margin: EdgeInsets.only(right: 15.w),
                child: Icon(Icons.search))
          ],
        ),
      )

    );
  }
}
