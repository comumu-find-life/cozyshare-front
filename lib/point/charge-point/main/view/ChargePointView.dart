
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/point/charge-point/main/widgets/ChargeHeader.dart';

import '../../../../constants/Fonts.dart';
import '../controller/ChargePointController.dart';
import '../widgets/InputChargeTextForm.dart';

class ChargePointView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ChargePointController _controller = ChargePointController();
    return Scaffold(
      bottomSheet: _buildButton(),
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '', color: kWhiteBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChargeHeaderr(_controller),
            InputChargeTextForm(_controller),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(){
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

        },
        child: ButtonText("Next", kWhiteBackGroundColor),
      ),
    );
  }

}
