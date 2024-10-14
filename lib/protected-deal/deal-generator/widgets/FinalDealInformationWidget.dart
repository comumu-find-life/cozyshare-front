import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../../constants/Colors.dart';
import '../controller/DealGeneratorController.dart';

class FinalDealInformationWidget extends StatelessWidget {
  DealGeneratorController _controller;


  FinalDealInformationWidget(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 30.h),
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
                child: NumberText("${_controller.bondController.text} \$", kTextBlackColor, 14),
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
            child: NumberText("${_controller.bondController.text} \$", kTextBlackColor, 14),
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
            child: Body2Text("Fee (paid by the tenant)", kGrey600Color),
          ),
          Container(
            child: NumberText("Free", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }


}
