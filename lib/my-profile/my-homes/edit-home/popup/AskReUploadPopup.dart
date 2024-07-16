import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/my-homes/main/controller/MyHomeListController.dart';

import '../../../../constants/Fonts.dart';
import '../controller/HomeEditController.dart';


class AskReuploadPopup {

  void showDialog(int homeId, MyHomeListController _controller, BuildContext context) {
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
                  child:  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kWhiteBackGroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),

                            InkWell(
                              onTap: (){

                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15.w,top: 15.h),
                                child: Icon(Icons.cancel,color: Colors.grey,size: 28,),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: 230.w,
                            margin: EdgeInsets.only(left: 0.w,top: 20.h),
                            child: FRegularText("Would you like to Re-upload this post?", kTextBlackColor, 15),

                          ),
                        ),
                        Container(
                          width: 280.w,
                          margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: kGrey200Color,
                                      borderRadius: BorderRadius.all(Radius.circular(6))
                                  ),
                                  child: Center(
                                    child: FRegularText("No", kWhiteBackGroundColor, 14),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  _controller.reupload(homeId);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.w),
                                  width: 160.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(6))
                                  ),
                                  child: Center(
                                    child: FRegularText("Yes", kWhiteBackGroundColor, 14),
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