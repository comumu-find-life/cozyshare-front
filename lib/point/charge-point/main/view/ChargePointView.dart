import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/point/charge-point/main/widgets/ChargeHeader.dart';

import '../../../../constants/Fonts.dart';
import '../controller/ChargePointController.dart';
import '../widgets/InputChargeTextForm.dart';

class ChargePointView extends StatelessWidget {
  UserAccountResponse userAccountResponse;
  double? requestAmount;

  ChargePointView(this.userAccountResponse, this.requestAmount);

  ChargePointController _controller = ChargePointController();

  @override
  Widget build(BuildContext context) {
    if(requestAmount != null) _controller.setInitAmount(requestAmount!);

    return Scaffold(
      bottomSheet: _buildButton(context),
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: kWhiteBackGroundColor,
      ),
      body: FutureBuilder(
        future: _controller.setInit(userAccountResponse),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Body2Text("Network Error", kTextBlackColor),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: (){
                      },
                      child: ChargeHeaderr(_controller)),
                  requestAmount==null?Container():_buildRequestAmount(requestAmount!),
                  InputChargeTextForm(_controller),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildRequestAmount(double chargeAmount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.h),
          child: FBoldText("Insufficient amount to complete the transaction", kTextBlackColor, 12),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h, left: 20.h),
          child: FBoldText("\$${chargeAmount}", kTextBlackColor, 17),
        ),
      ],
    );
  }


  Widget _buildButton(BuildContext context) {
    return Obx(() {
      return Container(
        height: 100.h,
        width: double.infinity,
        color: kWhiteColor,
        child: Column(
          children: [
            Divider(
              color: kGrey300Color,
              thickness: 0.6,
              height: 1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.w, bottom: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Body2Text("Reservation amount", kGrey700Color),
                        SizedBox(height: 5.h),
                        // Display the reactive amount here
                        Body1Text(
                            "\$${_controller.amount.value}", kTextBlackColor),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.moveChargeView(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 30.w, bottom: 15.h),
                      width: 100.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: FBoldText("Pay", kWhiteColor, 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
