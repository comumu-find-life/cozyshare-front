import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/point/charge-point/main/view/ChargePointView.dart';

class Pointchargepopup {
  void showPopup(UserAccountResponse userAccount, BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
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
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    height: 200.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 220.w,
                                margin: EdgeInsets.only(top: 30.h,left: 20.w),
                                child: FRegularText(
                                    "Your points are insufficient.",
                                    kGrey700Color,
                                    14)),
                            Container(
                                width: 220.w,
                                margin: EdgeInsets.only(top: 8.h),
                                child: FBoldText(
                                    "Would you like to go recharge?",
                                    kGrey700Color,
                                    14)),
                          ],
                        ),
                        Container(
                          width: 230.w,
                          margin: EdgeInsets.only(top: 70.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      color: kGrey200Color,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: Center(
                                    child: FBoldText("No", kWhiteColor, 14),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(() => ChargePointView(userAccount));
                                },
                                child: Container(
                                  width: 120.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: Center(
                                    child: FBoldText("Yes", kWhiteColor, 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
          });
        });
  }
}
