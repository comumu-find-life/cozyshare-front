
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/point/charge-point/main/widgets/ChargeHeader.dart';

import '../../../../constants/Fonts.dart';
import '../controller/ChargePointController.dart';
import '../widgets/InputChargeTextForm.dart';

class ChargePointView extends StatelessWidget {
  UserAccountResponse userAccountResponse;
  ChargePointView(this.userAccountResponse);


  ChargePointController _controller = ChargePointController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildButton(context),
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(canBack: true, title: '', color: kWhiteBackGroundColor,),
      body:FutureBuilder(
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
            return   SingleChildScrollView(
              child: Column(
                children: [
                  ChargeHeaderr(_controller),
                  InputChargeTextForm(_controller),
                ],
              ),
            );
          }
        },
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
          _controller.moveChargeView(context);
          //_controller.chargePoint(context);
        },
        child: ButtonText("Next", kWhiteBackGroundColor),
      ),
    );
  }

}
