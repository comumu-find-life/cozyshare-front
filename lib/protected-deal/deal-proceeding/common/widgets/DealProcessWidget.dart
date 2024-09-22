import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

/**
 * step 1 : 입금 확인 중
 * step 2: 입금 확인
 * step 3: 거래 완료
 */
Widget DealProcessWidget({
  required int step,
  required String? dealStartDateTime,
  required String? depositRequestDateTime,
  required String? depositCompletionDateTime,
  required String? dealCompletionRequestDateTime,
  required String? dealCompletionDateTime,
  required String? dealCancellationDateTime,
}) {
  return Container(
    color: kWhiteBackGroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        _buildProcessStep(
          title: "Before Deposit",
          dateTime: dealStartDateTime,
          isCompleted: true,
        ),
        _buildProcessStep(
          title: "Deposit Request",
          dateTime: depositRequestDateTime,
        ),
        _buildProcessStep(
          title: "Deposit Completed",
          dateTime: depositCompletionDateTime,
        ),
        _buildProcessStep(
          title: "Request for \nTransaction Completion",
          dateTime: dealCompletionRequestDateTime,
        ),
        _buildProcessStep(
          title: "Transaction Completed",
          dateTime: dealCompletionDateTime,
        ),
      ],
    ),
  );
}

Widget _buildProcessStep({
  required String title,
  required String? dateTime,
  bool isCompleted = false,
}) {
  bool isNull = dateTime == null;
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 380.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w),
              child: Icon(
                Icons.check_circle,
                color: isNull ? kGrey500Color : kPrimaryColor,
                size: 30.w,
              ),
            ),
            SizedBox(width: 8.w),
            Container(child: Body2Text(title, kTextBlackColor)),
          ],
        ),
        isNull
            ? Container()
            : Container(
                margin: EdgeInsets.only(right: 10.w),
                child: Body2Text("${dateTime}", kGrey800Color)),
      ],
    ),
  );
}
