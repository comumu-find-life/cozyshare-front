
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../constants/Colors.dart';
import '../../model/deal/response/ProtectedDealResponse.dart';

/**
 * 거래 정보 (계약금/보증금)
 */
class DealPriceWidget extends StatelessWidget {
  final double deposit; // 'depost' 오타 수정
  final double fee;

  // 생성자
  DealPriceWidget({
    required this.deposit,
    required this.fee,
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   margin: EdgeInsets.only(top: 30.h,left: 15.w),
        //   child: Title2Text("Transaction Information", kTextBlackColor),
        // ),
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
                child: Body2Text("Total Price", kGrey600Color),
              ),
              Container(
                child: NumberText("${fee + deposit} \$", kTextBlackColor, 14),
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
            child: Body2Text("Deposit", kGrey600Color),
          ),
          Container(
            child: NumberText("${deposit} \$", kTextBlackColor, 14),
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
            child: Body2Text("Fee", kGrey600Color),
          ),
          Container(
            child: NumberText("${fee} \$", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }


}
