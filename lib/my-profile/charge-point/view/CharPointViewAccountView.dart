

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../common-widgets/app-bar/CommonAppbar.dart';

class ChargePointAccountView extends StatelessWidget {
  const ChargePointAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        title: "",
        color: kWhiteBackGroundColor,
        canBack: false,
      ),
      body: Column(
        children: [
          Container(
            child: Body2Text("충전금액", kTextBlackColor),
          )
        ],
      ),
    );


  }
}
