import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/BankTransferController.dart';

class InputBankTransferFormView extends StatelessWidget {
  BankTransferController _controller = BankTransferController();
  int point;

  InputBankTransferFormView(this.point);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      bottomSheet: _buildButton(context),
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNameForm(),
            _builAccount(),
          ],
        ),
      ),
    );
  }
  
  Widget _builAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50.h),
          child: FBoldText("Deposit Account", kPrimaryColor, 14),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: kGrey200Color)
          ),
          width: 340.w,
          height: 60.h,
          child: Center(
            child: FBoldText("123-1234123", kTextBlackColor, 14),
          ),
        ),
      ],
    );
  }

  Widget _buildNameForm() {
    return Center(
      child: Container(
        width: 335.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: FBoldText(
                  "Please deposit ${point}\$ into the specified account and then click the 'Complete Deposit' button below.",
                  kTextBlackColor,
                  14),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: FBoldText("If you do not click the 'Complete Deposit' button, your point recharge may not be processed.", kErrorColor, 13),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context){
    return Container(
      width: double.infinity,
      color: kPrimaryColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          side: BorderSide.none,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {
          _controller.applyDeposit(context, point);
        },
        child: ButtonText("Complete Deposit", kWhiteBackGroundColor),
      ),
    );
  }
}
