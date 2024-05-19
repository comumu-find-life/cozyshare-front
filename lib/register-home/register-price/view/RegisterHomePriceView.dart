import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/button/ButtonWidgets.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/register-home/register-details/view/RegisterHomeDetailsView.dart';
import 'package:home_and_job/register-home/register-price/widgets/PriceFormWidget.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';

import '../../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../../constants/Colors.dart';
import '../../controller/HomeRegisterTotalController.dart';
import '../controller/HomePriceController.dart';

class RegisterHomePriceView extends StatelessWidget {
  HomeRegisterTotalController _controller;


  RegisterHomePriceView(
      this._controller); //HomePriceController _controller = HomePriceController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: _buildButton(),
        backgroundColor: kWhiteBackGroundColor,
        appBar: HomeRegisterAppBar(context,0.5),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 20.h),
              child: Title3Text("Room Price", kTextBlackColor),
            ),
            PriceFormWidget(_controller.homePriceController),
          ],
        )));
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() => _controller.homePriceController.isAppInputPrice
          ? InkWell(
              onTap: () {
                Get.to(() => RegisterHomeDetailsView(_controller),
                    transition: Transition.noTransition);
              },
              child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }
}
