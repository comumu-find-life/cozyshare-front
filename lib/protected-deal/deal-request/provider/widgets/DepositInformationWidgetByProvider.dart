
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../../../model/deal/response/ProtectedDealByGetterResponse.dart';
import '../../../../model/deal/response/ProtectedDealResponse.dart';
import '../../getter/poopup/DepositNamePopup.dart';

/**
 * provider 가 조회할 계약금/내 계좌 정보
 */
class DepositInformationWidgetByProvider extends StatelessWidget {
  ProtectedDealResponse _protectedDealResponse;


  DepositInformationWidgetByProvider(this._protectedDealResponse);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 30.h),
          child: Title2Text("My account information", kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
          child: HintText2("After the transaction is completed, the down payment will be deposited into the account below.", kGrey500Color),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 340.w,
            height: 120.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: kGrey300Color)
            ),
            child: Column(
              children: [
                // _buildAccount(),
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
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Body2Text("Account Holder", kGrey600Color),
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
          // Container(
          //   child: NumberText("${_protectedDealResponse.accountHolder}", kTextBlackColor, 14),
          // ),

        ],
      ),
    );
  }

  // Widget _buildAccount() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20.h),
  //     width: 310.w,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           child: Body2Text("Account Number", kGrey600Color),
  //         ),
  //         Container(
  //           child: NumberText("${_protectedDealResponse.bankName}" +" " + "${_protectedDealResponse.account}", kTextBlackColor, 14),
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }
}
