
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {


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
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 0.h, left: 10.w),
                    child: Title2Text("Find Life", kTextBlackColor))),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              child: Icon(size: 20.sp,Icons.notifications_none),
            )

          ],
        ),
      ),
    );
  }
}
