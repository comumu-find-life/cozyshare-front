import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/DealProcessControllerByGetter.dart';


class AfterDepositCancelPopup {
  void showPopup(int dealId, DealProcessControllerByGetter controller, BuildContext context) {
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
              backgroundColor: kWhiteColor,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: DefaultTextStyle(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    height: 230.h,
                    width: 300.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 230.w,
                          margin: EdgeInsets.only(top: 30.h),
                          child: Body2Text("If you cancel the transaction, the amount will be refunded as points after deducting the fee.", kTextBlackColor),
                        ),
                        Container(
                            width: 230.w,
                            margin: EdgeInsets.only(top: 20.h),
                            child: FBoldText("Do you agree to this and wish to cancel the transaction?", kTextBlackColor, 14)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30.h,left: 10.w, right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: kGrey400Color)
                                  ),
                                  child: Center(
                                    child: ButtonText("No", kTextBlackColor),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: ()async{
                                  controller.cancelDeal(dealId, context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  width: 100.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(color: kGrey400Color)
                                  ),
                                  child: Center(
                                    child: ButtonText("Yes", kTextBlackColor),
                                  ),
                                ),
                              )
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
