import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/button/ButtonWidgets.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/register-home/register-details/widgets/HomeOptionSelect.dart';
import 'package:home_and_job/register-home/register-details/widgets/HomeRoomCountForm.dart';
import 'package:home_and_job/register-home/register-details/widgets/HomeTypeSelect.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';
import '../../../model/home/enums/HomeOption.dart';

import '../../../../common-widgets/app-bar/CommonAppbar.dart';
import '../../../../constants/Colors.dart';
import '../../controller/HomeRegisterTotalController.dart';
import '../../register-introduce/view/RegisterHomeIntroduceView.dart';
import '../controller/HomeRegisterDetailsController.dart';

class RegisterHomeDetailsView extends StatelessWidget {
  HomeRegisterTotalController _controller;

  RegisterHomeDetailsView(
      this._controller); //HomeRegisterDetailsController _controller = HomeRegisterDetailsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: _buildButton(),
        backgroundColor: kWhiteBackGroundColor,
        appBar: CommonAppBar(
          color: kWhiteBackGroundColor,
          title: "",
          canBack: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeRegisterProcessBar(0.6),
            HomeTypeSelect(_controller.homeRegisterDetailsController),
            HomeRoomCountForm(_controller.homeRegisterDetailsController),
            HomeOptionSelect(_controller.homeRegisterDetailsController),
            Container(
              height: 150.h,
            )
          ],
        )));
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() => _controller.homeRegisterDetailsController.isNextStep
          ? InkWell(
              onTap: () {
                Get.to(() => RegisterHomeIntroduceView(_controller),
                    transition: Transition.noTransition);
              },
              child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }
}
