import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/point/register-account/view/RegisterAccountView.dart';
import 'package:home_and_job/rest-api/chat-api/ChatApi.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/chat/request/DirectMessageApplicationDto.dart';
import 'package:home_and_job/utils/SnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/Fonts.dart';
import '../chat-detail-getter/view/ChatGetterDetailView.dart';
import '../chat-detail-provider/view/ChatProviderDetailView.dart';


class RegisterAccountPopup {

  void showDialog( BuildContext context) {
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
                child: SingleChildScrollView(
                    child: Container(
                      width: 300.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kWhiteBackGroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            width: 180.w,
                            margin: EdgeInsets.only(left: 15.w,top: 30.h),
                            child: Text("Please register your account information first.",style: TextStyle(fontSize: 17,color: kTextBlackColor,fontFamily: "boldfont"),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50.h, bottom: 10.h),
                            width: 240.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 90.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kGrey200Color),
                                        borderRadius: BorderRadius.all(Radius.circular(6))
                                    ),
                                    child: Center(
                                      child: Body2Text("No", kGrey600Color),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                    Get.to(() => RegisterAccountView());
                                  },
                                  child: Container(
                                    width: 140.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.all(Radius.circular(6))
                                    ),
                                    child: Center(
                                      child: Body2Text("Okay", kWhiteBackGroundColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ),
              ),
            );
          });
        });
  }
}