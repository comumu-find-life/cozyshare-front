import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/common-widgets/button/ButtonWidgets.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/register-home/controller/RegisterHomeController.dart';
import 'package:home_and_job/my-profile/register-home/view/RegisterHomeAddressView.dart';
import 'package:home_and_job/my-profile/register-home/widgets/RegisterHomeImageWidget.dart';

class RegisterHomeImageView extends StatelessWidget {
  RegisterHomeController _controller = RegisterHomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        title: "",
        canBack: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegisterHomeImageWidget(_controller),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() => _controller.isRegisterImage
          ? InkWell(
              onTap: () {
                Get.to(() => RegisterHomeAddressView(_controller));
              },
              child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }
}
