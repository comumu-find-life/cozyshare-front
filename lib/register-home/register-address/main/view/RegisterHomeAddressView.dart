import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';

import '../../../../common-widgets/button/ButtonWidgets.dart';
import '../../../../constants/Colors.dart';
import '../../../controller/HomeRegisterTotalController.dart';
import '../../../register-price/view/RegisterHomePriceView.dart';
import '../widgets/InputAddressFormWidget.dart';

class RegisterHomeAddressView extends StatelessWidget {
  HomeRegisterTotalController _controller;


  RegisterHomeAddressView(
      this._controller); //HomeAddressController _controller = HomeAddressController();

  List<String> _states = [
    "ACT",
    "NSW",
    "NT",
    "QLD",
    "SA",
    "TAS",
    "VIC",
    "WA"
    // 여기에 더 많은 도시를 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteBackGroundColor,
        bottomSheet: _buildButton(),
        appBar: HomeRegisterAppBar(context,0.3),
        body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainText(),
                      AddressFormWidget(_controller.homeAddressController)
                    ],
                  ),
                ],
              ),
            ));
  }

  Widget _buildMainText(){
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
      child: Title3Text("Room Address", kTextBlackColor),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() => _controller.homeAddressController.isAllInputAddress
          ? InkWell(
              onTap: () {
                Get.to(() => RegisterHomePriceView(_controller),
                    transition: Transition.noTransition);
              },
              child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }


}
