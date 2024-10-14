
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/deal/response/ProtectedDealResponse.dart';

Widget DealPaymentInformationWidget(ProtectedDealResponse dealResponse) {
  return Container(
    width: 380.w,
    color: kWhiteBackGroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50.h, left: 20.w),
          child: FBoldText("Payment Information", kTextBlackColor, 14),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 15.h, left: 0.w),
            width: 350.w,
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: kGrey400Color),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 260.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: FRegularText("Deposit", kGrey700Color, 14),
                      ),
                      Container(
                        child: FBoldText("${dealResponse.deposit}", kTextBlackColor, 14),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 260.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: FRegularText("Fee", kGrey700Color, 14),
                      ),
                      Container(
                        child: FBoldText("${dealResponse.fee}", kTextBlackColor, 14),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 280.w,
                  height: 1.h,
                  color: kGrey300Color,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 260.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: FRegularText("Total Price", kGrey700Color, 14),
                      ),
                      Container(
                        child: FBoldText("${dealResponse.deposit + dealResponse.fee}", kTextBlackColor, 14),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}