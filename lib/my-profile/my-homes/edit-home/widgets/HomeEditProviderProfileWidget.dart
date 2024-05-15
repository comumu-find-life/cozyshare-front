
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../constants/Colors.dart';


class HomeEditProviderProfileWidget extends StatelessWidget {
  const HomeEditProviderProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      margin: EdgeInsets.only(left: 20.w, top: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            child: CircleAvatar(
              backgroundColor: kGrey200Color,
              backgroundImage: AssetImage("assets/images/test/man.png"),
            ),
          ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               margin: EdgeInsets.only(left: 10.w),
               child: FBoldText("sinminseok", kGrey800Color, 16),
             ),
             Container(
               margin: EdgeInsets.only(left: 10.w,top: 5.h),
               child: Row(
                 children: [
                   Container(
                       width: 25.w,
                       height: 25.h,
                       child: Image.asset("assets/icons/facebook_logo.png")
                   ),
                   Container(
                     margin: EdgeInsets.only(left: 6.w),
                       width: 25.w,
                       height: 25.h,
                       child: Image.asset("assets/icons/instagram_logo.png")
                   ),
                 ],
               ),
             )
           ],
         )

        ],
      ),
    );
  }
}
