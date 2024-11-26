import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/user/response/PointChargeHistoryResponse.dart';
import 'package:home_and_job/utils/Converter.dart';

import '../../../constants/Colors.dart';
import '../controller/MyPointController.dart';

class MyPointHistory extends StatelessWidget {
  MyPointController _controller;

  MyPointHistory(this._controller);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 13.w, top: 50.h),
                child: FBoldText("History", kTextBlackColor, 14))
          ],
        ),
        _controller.userAccountResponse!.chargeHistories.length == 0
            ? Container(
                margin: EdgeInsets.only(top: 15.h),
                width: 350.w,
                height: 320.h,
                decoration: BoxDecoration(
                    border: Border.all(color: kGrey300Color),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Center(child: Body2Text("Empty", kTextBlackColor)),
              )
            : Container(
                margin: EdgeInsets.only(top: 15.h),
                width: 350.w,
                height: 320.h,
                decoration: BoxDecoration(
                    border: Border.all(color: kGrey300Color),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  width: 380.w,
                  child: Column(
                    children: _controller.userAccountResponse!.chargeHistories
                        .map((history) {
                      return _buildHistoryItem(history);
                    }).toList(),
                  ),
                ),
              ),
      ],
    ));
  }

  Widget _buildHistoryItem(PointChargeHistoryResponse history) {
    var formatEnglishDateTime =
        ConverterUtil().formatEnglishDateTime(history.chargeDate);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 340.w,
          height: 40.h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    child: FRegularText(
                        "${formatEnglishDateTime}", kTextBlackColor, 14),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15.w),
                    child: FBoldText(
                        "${history.chargeAmount} \$", kTextBlackColor, 14),
                  ),
                ],
              )
            ],
          ),
        ),

        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                margin: EdgeInsets.only(right: 15.w),
                child: FRegularText("${history.chargeType.command}", kTextBlackColor, 12),
              )
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 320.w,
          height: 1.h,
          color: kGrey400Color,
        ),
      ],
    );
  }
}
