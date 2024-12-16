import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../my-point/controller/MyPointController.dart';
import '../widgets/InputCashOutTextForm.dart';

class CashOutView extends StatelessWidget {
  MyPointController _controller;


  CashOutView(this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildButton(context),
      backgroundColor: kWhiteBackGroundColor,
      appBar:
          CommonAppBar(canBack: true, title: "Cash Out", color: kWhiteBackGroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMyPoint(),
            InputCashOutTextForm(_controller)
          ],
        ),
      ),
    );
  }

  Widget _buildMyPoint() {
    return Column(
      children: [
        Container(
          width: 80.w,
          child: Image.asset("assets/icons/point.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: FBoldText("Current My Point", kGrey700Color, 15),
        ),
        Container(
          margin: EdgeInsets.only(top: 26.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FBoldText("${_controller.userAccountResponse!.point}", kGrey700Color, 18),
              ),
              Container(
                child: Icon(Icons.attach_money),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context){
    return Container(
      height: 70.h,
      width: double.infinity,
      color: kPrimaryColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          side: BorderSide.none,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {
          _controller.withDraw(context);
        },
        child: ButtonText("Withdraw", kWhiteBackGroundColor),
      ),
    );
  }

}
