import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../controller/ChargePointController.dart';

class ChargeHeaderr extends StatelessWidget {
  ChargePointController _controller;

  ChargeHeaderr(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 150.w,
                child: Image.asset("assets/icons/saving.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: FBoldText("Charge Point", kTextBlackColor, 18),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    child: FRegularText(
                        "Recharge your points \nto safely transact homes.",
                        kTextBlackColor,
                        14),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    child: FBoldText(
                        "Current Point : ${_controller.userAccountResponse.point}P",
                        kTextBlackColor,
                        12),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
