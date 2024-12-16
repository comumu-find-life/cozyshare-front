import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';

import '../../../model/deal/response/ProtectedDealResponse.dart';
import '../../../protected-deal/deal-deposit-cancel/provider/DealCancelDepositViewByProvider.dart';
import '../../../protected-deal/deal-request/provider/view/DealRequestViewByProvider.dart';
import '../controller/ChatProviderDetailController.dart';

Widget ProviderDealStartMessageWidget(
    ProtectedDealResponse dealByProviderResponse,
    ChatProviderDetailController controller) {
  // ProtectedDealByProviderResponse? dealResponse = controller.dealResponse;
  bool isCancelDeposit =
      dealByProviderResponse.dealState == DealState.CANCEL_BEFORE_DEAL
          ? true
          : false;
  return Container(
    width: 250.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      border: Border.all(color: kGrey100Color),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.h, left: 13.w),
          child: isCancelDeposit
              ? Title3Text("Cancel Deposit", kTextBlackColor)
              : Title3Text("Request for Deposit Payment", kTextBlackColor),
        ),
        Padding(
          padding: EdgeInsets.only(top: 3.h, left: 13.w, bottom: 20.h),
          child: Helper2Text(
              "Deposit : ${dealByProviderResponse?.deposit} \$", kGrey400Color),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: InkWell(
              onTap: () {
                isCancelDeposit
                    ? Get.to(() =>
                        DealCancelDepositViewByProvider(dealByProviderResponse))
                    : Get.to(() => DealRequestViewByProvider(
                        dealByProviderResponse, controller));
              },
              child: Container(
                width: 230.w,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: kLightBlue,
                ),
                child: Center(
                  child: Helper2Text(
                    "Check",
                    kDarkBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
