import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/response/LatLng.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/controller/HomeEditController.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/view/AddressEditValidateView.dart';
import 'package:home_and_job/register-home/register-address/validate-address/view/AddressValidateMapView.dart';
import 'package:home_and_job/register-home/widgets/HomeRegisterProcessBar.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../../common-widgets/button/ButtonWidgets.dart';
import '../../../../constants/Colors.dart';
import '../controller/HomeAddressEditController.dart';
import '../widgets/AddressEditFormWidget.dart';

class HomeEditAddressView extends StatelessWidget {
  HomeEditController _homeEditController;
  HomeAddressEditController _controller = HomeAddressEditController();

  HomeEditAddressView(this._homeEditController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet: _buildButton(context),
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: kWhiteBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainText(),
              AddressEditFormWidget(_controller),
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
        if (_controller.isAllInputAddress) {
          return InkWell(
            onTap: _controller.isValidateAddress
                ? () => _navigateToRegisterHomePriceView(context)
                : () => _validateAddress(context),
            child: _controller.isValidateAddress
                ? NextButtonWidget("Done")
                : NextButtonWidget("Check Address"),
          );
        } else {
          return NotYetButtonWidget("Done");
        }
      }),
    );
  }

  //Collins

  Future<void> _navigateToRegisterHomePriceView(BuildContext context) async {
    var generateHomeAddress = _controller.generateHomeAddress();

    _homeEditController.updateAddress(generateHomeAddress);
    Navigator.pop(context);
  }

  Future<void> _validateAddress(BuildContext context) async {
    var customLatLng = await _controller.validateAddress();

    if (customLatLng == null) {
      // 주소 유효성 검사 실패 시 스낵바를 보여줍니다.
      CustomSnackBar().show(context, "Invalid address format.");
    } else {
      Get.to(() => AddressEditValidateView(customLatLng, _controller));
    }
  }
}
