

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_and_job/reservation/common/view/ReservationExampleView.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';

class ReservationPriceWidget extends StatelessWidget {
  const ReservationPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 25.h),
              child: Title2Text("Reservation Deposit", kTextBlackColor),
            ),
            InkWell(
              onTap: (){
                Get.to(() => ReservationExampleView());
              },
              child: Container(
                margin: EdgeInsets.only(left: 9.w, top: 25.h),
                child: Icon(Icons.report, color: kPrimaryColor,),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w),
          child: FRegularText("If you meet the landlord on the scheduled date, your deposit will be refunded.", kGrey600Color, 14),
        ),
      ],
    );
  }
}
