
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/Colors.dart';
import '../../../../constants/Fonts.dart';
import '../../getter/poopup/DepositNamePopup.dart';

/**
 * provider 가 조회할 계약금/내 계좌 정보
 */
class DepositInformationWidgetByProvider extends StatelessWidget {
  const DepositInformationWidgetByProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 30.h),
          child: Title2Text("내 계좌 정보", kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 20.h),
          child: HintText2("거래 성사 후 아래 계좌를 통해 보증금/계약금이 입금됩니다.", kGrey500Color),
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
                child: Body2Text("이름", kGrey600Color),
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
            child: NumberText("DASE!@#", kTextBlackColor, 14),
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
            child: NumberText("941602-00748799", kTextBlackColor, 14),
          ),

        ],
      ),
    );
  }
}
