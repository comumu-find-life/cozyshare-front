
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealByGetterResponse.dart';

import '../poopup/DepositNamePopup.dart';

/**
 * 입금 취소 팡버
 */
class CancelDepositPopup extends StatelessWidget {
  ProtectedDealByGetterResponse dealByGetterResponse;


  CancelDepositPopup(this.dealByGetterResponse);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 30.h),
          child: Title2Text("Deposit Account", kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 20.h),
          child: HintText2("The account below is a Find Life virtual account.\n\nThe deposited will be transferred to the landlord after the transaction is completed.", kGrey500Color),

        ),

        Container(
          margin: EdgeInsets.only(left: 20.w, top: 20.h),
          child: HintText2("You must change the name to the 'Depositor's Name' below before making the transfer for it to be processed correctly. ", kErrorColor),

        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 340.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: kGrey300Color)
            ),
            child: Column(
              children: [
                _buildAccount(),
                _buildIdInformation(context),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildIdInformation(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Body2Text("Depositor's Name", kGrey600Color),
              ),
              InkWell(
                onTap: () {

                  DepositNamePopup().createGoalPopup(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Icon(
                    Icons.report,
                    color: kDarkBlue,
                    size: 18.sp,
                  ),
                ),
              )
            ],
          ),
          Container(
            //todo
            child: NumberText("apple pretty", kTextBlackColor, 14),
            // child: NumberText("${dealByGetterResponse.randomDepositorName}", kTextBlackColor, 14),
          ),

        ],
      ),
    );
  }

  Widget _buildAccount() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body2Text("입금 계좌", kGrey600Color),
          ),
          Container(
            child: NumberText("123123123123", kTextBlackColor, 14),
          ),

        ],
      ),
    );
  }
}
