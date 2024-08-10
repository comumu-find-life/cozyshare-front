import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 20.h,
      ),
     _buildDealStartDateTime(dealStartDateTime!),
      _buildDepositRequestDateTime(depositRequestDateTime),
      _buildDepositCompletionDateTime(depositCompletionDateTime),
      _buildDealCompletionRequestDateTime(dealCompletionRequestDateTime),
      _buildDealCompletionDateTime(dealCompletionDateTime),
      // _buildProcessBarCircle(step),
      // _buildProcessText(step),
    ],
  );
}

Widget _buildDealStartDateTime(String time) {
  return Container(
    width: 340.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              child: Icon(
                Icons.check_circle,
                color: kPrimaryColor,
              ),
            ),
            Container(
              child: Body2Text("입금 전", kTextBlackColor),
            ),
          ],
        ),

        Container(
          child: Body2Text("${time}", kGrey800Color),
        )
      ],
    ),
  );
}

Widget _buildDepositRequestDateTime(String? dateTime) {
  bool isNull = dateTime == null ? true : false;
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 340.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              child: Icon(
                Icons.check_circle,
                color: isNull ? kGrey500Color : kPrimaryColor,
              ),
            ),
            Container(
              child: Body2Text("입금 신청", kTextBlackColor),
            ),
          ],
        ),
        isNull
            ? Container()
            : Container(
                child: Body2Text("${dateTime}", kGrey800Color),
              )
      ],
    ),
  );
}

Widget _buildDepositCompletionDateTime(String? dateTime) {
  bool isNull = dateTime == null ? true : false;
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 340.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              child: Icon(
                Icons.check_circle,
                color: isNull ? kGrey500Color : kPrimaryColor,
              ),
            ),
            Container(
              child: Body2Text("입금 완료", kTextBlackColor),
            ),
          ],
        ),
        isNull
            ? Container()
            : Container(
                child: Body2Text("${dateTime}", kGrey800Color),
              )
      ],
    ),
  );
}

Widget _buildDealCompletionRequestDateTime(String? dateTime) {
  bool isNull = dateTime == null ? true : false;
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 340.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              child: Icon(
                Icons.check_circle,
                color: isNull ? kGrey500Color : kPrimaryColor,
              ),
            ),
            Container(
              child: Body2Text("거래 완료 신청", kTextBlackColor),
            ),
          ],
        ),
        isNull
            ? Container()
            : Container(
                child: Body2Text("${dateTime}", kGrey800Color),
              )
      ],
    ),
  );
}

Widget _buildDealCompletionDateTime(String? dateTime) {
  bool isNull = dateTime == null ? true : false;
  return Container(
    margin: EdgeInsets.only(top: 10.h,),
    width: 340.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 35.w,
              height: 35.h,
              child: Icon(
                Icons.check_circle,
                color: isNull ? kGrey500Color : kPrimaryColor,
              ),
            ),
            Container(
              child: Body2Text("거래 완료", kTextBlackColor),
            ),
          ],
        ),
        isNull
            ? Container()
            : Container(
                child: Body2Text("${dateTime}", kGrey800Color),
              )
      ],
    ),
  );
}


