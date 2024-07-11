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
      height: 280.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: kGrey200Color)),
      child: Column(
        children: [
          _buildBond(),
          _buildCharge(),
          _buildName(),
          _buildAccountInformation(),
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
                child: Body2Text("총 요청금액", kGrey600Color),
              ),
              Container(
                child: NumberText("추후 협의 \$", kTextBlackColor, 14),
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
            child: Body2Text("계약금/보증금", kGrey600Color),
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
            child: Body2Text("수수료 (세입자 부담)", kGrey600Color),
          ),
          Container(
            child: NumberText("추후 협의", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }

  Widget _buildName() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body2Text("예금주", kGrey600Color),
          ),
          Container(
            child: NumberText("${_controller.nameController.text}", kTextBlackColor, 14),
          )
        ],
      ),
    );
  }

  Widget _buildAccountInformation() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body2Text("계좌", kGrey600Color),
          ),
          Container(
            child: NumberText("${_controller.bankController.text} ${_controller.accountController.text}", kTextBlackColor, 13),
          )
        ],
      ),
    );
  }
}
