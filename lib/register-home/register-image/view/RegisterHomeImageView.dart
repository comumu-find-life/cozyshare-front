import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/common-widgets/button/ButtonWidgets.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';
import '../../controller/HomeRegisterTotalController.dart';
import '../controller/RegisterImageController.dart';
import '../widgets/RegisterHomeImageWidget.dart';
import '../../register-address/view/RegisterHomeAddressView.dart';

class RegisterHomeImageView extends StatelessWidget {
  HomeRegisterTotalController _controller = HomeRegisterTotalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildButton(),
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        title: "",
        canBack: true,
      ),
      backgroundColor: kWhiteBackGroundColor,
      body: Column(
        children: [
          HomeRegisterProcessBar(0.0),
          RegisterHomeImageWidget(_controller.homeImageController),
          //_buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() => _controller.homeImageController.isRegisterImage
          ? InkWell(
              onTap: () {
                Get.to(() => RegisterHomeAddressView(_controller),
                    transition: Transition.noTransition);
              },
              child: NextButtonWidget("Next"))
          : NotYetButtonWidget("Next")),
    );
  }
}
