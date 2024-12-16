import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/account/login/view/MainLoginView.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../../chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import '../../../../model/deal/response/ProtectedDealResponse.dart';
import '../controller/DealRequestControllerByGetter.dart';
import '../poopup/PointChargePopup.dart';

class AcceptanceView extends StatelessWidget {
  int dealId;
  ChatGetterDetailController _chatGetterDetailController;
  DealRequestControllerByGetter _controller;
  ProtectedDealResponse dealResponse;

  AcceptanceView(this.dealId, this._chatGetterDetailController,
      this._controller, this.dealResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: FBoldText(
                      "What is Secure Transaction?", kPrimaryColor, 18),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: kGrey700Color),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  margin: EdgeInsets.only(top: 10.h),
                  width: 340.w,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(15),
                          child: FBoldText(
                              "When the transaction is completed, the points will be transferred to the landlord.",
                              kTextBlackColor,
                              16)),
                      Container(
                          margin: EdgeInsets.all(15),
                          child: FRegularText(
                              "The fee is 5% of the deposit and is to be borne by the tenant.",
                              kGrey600Color,
                              15)),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  child: FBoldText(
                      "What if the landlord is a scammer?", kPrimaryColor, 18),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: kGrey700Color),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    margin: EdgeInsets.only(top: 10.h),
                    width: 340.w,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(15),
                            child: FBoldText(
                                "If you meet in person and suspect the listing is fake or the person is a scammer, you can get your points refunded.",
                                kTextBlackColor,
                                16)),
                        Container(
                            margin: EdgeInsets.all(15),
                            child: FRegularText(
                                "To prevent excessive transaction cancellations, the points will be refunded minus the fee.",
                                kGrey600Color,
                                15)),
                      ],
                    )),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                width: 340.w,
                child: FRegularText(
                    "If you press the 'Yes' button, points will be deducted.",
                    kTextBlackColor,
                    14),
              ),
            ),
            Container(
              width: 340.w,
              margin: EdgeInsets.only(top: 140.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 160.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: kGrey600Color),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: ButtonText("No", kTextBlackColor),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {

                      bool? response = await _chatGetterDetailController
                          .checkUserPoint(dealId);
                      if (!response!) {
                        var amount = dealResponse.totalPrice - _chatGetterDetailController.userAccountResponse!.point;
                        Pointchargepopup().showPopup(
                            amount,
                            _chatGetterDetailController.userAccountResponse!,
                            context);
                      } else {
                        var response =
                            await _controller.acceptDeal(dealResponse!.id);
                        if (response) {
                          _chatGetterDetailController
                              .applyDeposit(dealResponse!.id);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          CustomSnackBar().show(context, "Error");
                        }
                      }
                    },
                    child: Container(
                      width: 160.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: ButtonText("Yes", kWhiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
