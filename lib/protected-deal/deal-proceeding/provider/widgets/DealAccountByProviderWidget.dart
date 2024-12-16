
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../model/deal/response/ProtectedDealResponse.dart';



class DealAccountByProviderWidget extends StatelessWidget {
  ProtectedDealResponse dealByProviderResponse;


  DealAccountByProviderWidget(this.dealByProviderResponse);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.w, top: 20.h),
            child: Title2Text("계좌 정보", kTextBlackColor),
          ),

          Container(
            margin: EdgeInsets.only(left: 10.w, top: 15.h,right: 10.w, bottom: 50.h),
            width: 350.w,
            height: 120.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: kGrey200Color)),
            child: Column(
              children: [
                //_buildName(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildAccountInformation() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20.h),
  //     width: 310.w,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           child: Body2Text("계좌", kGrey600Color),
  //         ),
  //         Container(
  //           child: NumberText("${dealByProviderResponse.bankName}  ${dealByProviderResponse.account}", kTextBlackColor, 13),
  //         )
  //       ],
  //     ),
  //   );
  // }


  // Widget _buildName() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20.h),
  //     width: 310.w,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           child: Body2Text("예금주", kGrey600Color),
  //         ),
  //         Container(
  //           child: NumberText("${dealByProviderResponse.accountHolder}", kTextBlackColor, 14),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
