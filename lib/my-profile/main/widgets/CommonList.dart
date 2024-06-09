
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../constants/Colors.dart';

class CommonList extends StatelessWidget {
  const CommonList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.h),
        width: 355.w,
        height: 150.h,
        decoration: BoxDecoration(
            color: kWhiteBackGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Container(
          margin: EdgeInsets.only(top: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProtectedDeal(),
            //  _buildCustomerCenter(),
            //  _buildCustomerCenter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProtectedDeal() {
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.health_and_safety_rounded, color: kWhiteBackGroundColor,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.h,left: 5.w),
              child: Center(
                child: FRegularText("Safe Deal", kTextBlackColor, 14),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildCustomerCenter() {
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.health_and_safety_rounded, color: kWhiteBackGroundColor,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Center(
                child: FRegularText("Safe Deal", kTextBlackColor, 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
