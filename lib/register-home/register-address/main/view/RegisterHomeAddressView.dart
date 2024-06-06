import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';
import 'package:home_and_job/register-home/register-address/validate-address/view/AddressValidateMapView.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../../common-widgets/button/ButtonWidgets.dart';
import '../../../../constants/Colors.dart';
import '../../../controller/HomeRegisterTotalController.dart';
import '../../../register-price/view/RegisterHomePriceView.dart';
import '../widgets/InputAddressFormWidget.dart';

class RegisterHomeAddressView extends StatelessWidget {
  final HomeRegisterTotalController _controller;

  RegisterHomeAddressView(this._controller);

  final List<String> _states = [
    "ACT", "NSW", "NT", "QLD", "SA", "TAS", "VIC", "WA"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: _buildButton(context),
      appBar: HomeRegisterAppBar(context, 0.3),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainText(),
              AddressFormWidget(_controller.homeAddressController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 20.w),
      child: Title3Text("Room Address", kTextBlackColor),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Obx(() {
        if (_controller.homeAddressController.isAllInputAddress) {
          return InkWell(
            onTap: _controller.homeAddressController.isValidateAddress
                ? () => _navigateToRegisterHomePriceView()
                : () => _validateAddress(context),
            child: _controller.homeAddressController.isValidateAddress
                ? NextButtonWidget("Next")
                : NextButtonWidget("Check Address"),
          );
        } else {
          return NotYetButtonWidget("Next");
        }
      }),
    );
  }

  Future<void> _navigateToRegisterHomePriceView() async {
    // 주소 유효성 검사 API 연동
    Get.to(() => RegisterHomePriceView(_controller),
        transition: Transition.noTransition);
  }

  Future<void> _validateAddress(BuildContext context) async {
    // 주소 유효성 검사 API 연동
    CustomLatLng? customLatLng =
    await _controller.homeAddressController.validateAddress();

    if (customLatLng == null) {
      // 주소 유효성 검사 실패 시 스낵바를 보여줍니다.
      CustomSnackBar().show(context, "Invalid address format.");
    } else {
      Get.to(() => AddressValidateView(
          customLatLng, _controller.homeAddressController));
    }
  }


}
