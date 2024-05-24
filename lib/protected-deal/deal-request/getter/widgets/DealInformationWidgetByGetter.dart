
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../constants/Colors.dart';

/**
 * 거래 정보 (계약금/보증금)
 */
class DealInformationWidgetByGetter extends StatelessWidget {
  const DealInformationWidgetByGetter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h,left: 15.w),
          child: Title2Text("거래 정보", kTextBlackColor),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, top: 15.h,right: 10.w),
          width: 350.w,
          height: 200.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: kGrey200Color)),
          child: Column(
            children: [

              _buildBond(),
              _buildCharge(),
              _buildTotalPrice(),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTotalPrice() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h),
          width: 310.w,
          height: 0.6.h,
          color: kGrey200Color,
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 310.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Body2Text("총 요청금액", kGrey600Color),
              ),
              Container(
                child: NumberText("2015 \$", kTextBlackColor, 14),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBond() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body2Text("계약금/보증금", kGrey600Color),
          ),
          Container(
            child: NumberText("2000 \$", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }

  Widget _buildCharge() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body2Text("수수료 (세입자 부담)", kGrey600Color),
          ),
          Container(
            child: NumberText("15 \$", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }

  Widget _buildName() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body2Text("예금주", kGrey600Color),
          ),
          Container(
            child: NumberText("신민석", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }

  Widget _buildAccountInformation() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body2Text("계좌", kGrey600Color),
          ),
          Container(
            child: NumberText("국민은행 94160200748799", kTextBlackColor, 13),
          )
        ],
      ),
    );
  }
}
