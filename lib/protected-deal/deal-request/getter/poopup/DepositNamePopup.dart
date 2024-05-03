import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class DepositNamePopup {
  void createGoalPopup(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true
        ,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(

              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: DefaultTextStyle(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  child:  Container(
                    height: 300.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 20.h),
                            child: Title2Text("주의", kDarkBlue)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 220.w,
                                margin: EdgeInsets.only(top: 30.h),
                                child: Body2Text("해당 계좌로 입금할때 입금자 명은 발급된 코드를 입력해야 합니다.", kGrey700Color)),
                            Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Helper2Text("입금자 명 : {발급 코드}", kTextBlackColor))
                          ],
                        )

                      ],
                    ),
                  )),
            );
          });
        });
  }
}