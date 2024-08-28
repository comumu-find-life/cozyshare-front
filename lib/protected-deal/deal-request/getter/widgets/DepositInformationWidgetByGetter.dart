
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/deal/response/ProtectedDealByGetterResponse.dart';

import '../poopup/DepositNamePopup.dart';

/**
 * 가상 계좌 (Getter 만 보여줌)
 */
class DepositInformationWidgetByGetter extends StatelessWidget {
  ProtectedDealByGetterResponse dealByGetterResponse;


  DepositInformationWidgetByGetter(this.dealByGetterResponse);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 30.h),
          child: Title2Text("입금 계좌", kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 20.h),
          child: HintText2("아래 계좌는 Find Life 가상 계좌입니다.\n\n입금된 보증금/계약금은 거래 성사 후 집주인에게 전달됩니다.", kGrey500Color),

        ),

        Container(
          margin: EdgeInsets.only(left: 20.w, top: 20.h),
          child: HintText2("아래 '입금자 이름'으로 변경 후 송금을 해야 정상적으로 처리 됩니다. ", kErrorColor),

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
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Body2Text("입금자 이름", kGrey600Color),
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
            width: 210.w,
            child: NumberText("${dealByGetterResponse.randomDepositorName}", kTextBlackColor, 14),
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
