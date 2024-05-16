import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/RoomListController.dart';
import 'SearchBarWidget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  RoomListController _controller;


  HomeAppBar(this._controller);

  @override
  Size get preferredSize => Size.fromHeight(65.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kWhiteBackGroundColor,
        automaticallyImplyLeading: false,
        title: Container(
          width: 360.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Icon(Icons.arrow_back_ios, size: 17.sp,),
                ),
              ),
              SearchBarWidget(_controller),
              Container()
            ],
          ),
        ));
  }
}
