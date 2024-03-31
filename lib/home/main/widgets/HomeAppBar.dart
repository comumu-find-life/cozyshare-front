import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {


  @override
  Size get preferredSize => Size.fromHeight(55.h);

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
                  child: Icon(Icons.arrow_back_ios, size: 17.sp,),
                ),
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 0.h, right: 0.w),
                      child: Title3Text("집", kTextBlackColor))),
              Container()
            ],
          ),
        ));
  }
}
