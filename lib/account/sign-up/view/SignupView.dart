import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/rest-api/user-api/SignupApi.dart';
import 'package:home_and_job/account/sign-up/widgets/PrivacyForm.dart';
import 'package:home_and_job/account/sign-up/widgets/UserDetailForm.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';

import '../controller/SignupController.dart';
import '../widgets/EmailForm.dart';
import '../widgets/ProgressBar.dart';

class SignupView extends StatelessWidget {
  final SignupController _controller = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: kWhiteBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProgressBar(_controller),
              _buildCurrentForm(),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentForm() {
    switch (_controller.step) {
      case 1:
        return EmailForm(_controller);
      case 2:
        return PrivacyForm(_controller);
      default:
        return UserDetailForm(_controller);
    }
  }

  Widget _buildActionButton() {
    switch (_controller.step) {
      case 1:
        return _buildButton(
          onTap: _controller.checkEmail ? _controller.ontapEmailButton : null,
          isEnabled: _controller.checkEmail,
        );
      case 2:
        return _buildButton(
            onTap: _controller.ontapPrivacyButton,
            isEnabled: _controller.checkPrivacy);

      default:
        return _buildButton(
            onTap: _controller.ontapDetailButton,
            isEnabled: _controller.checkDetail);
    }
  }

  Widget _buildButton({required VoidCallback? onTap, bool isEnabled = true}) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 335.w,
          height: 65.h,
          decoration: BoxDecoration(
            color: isEnabled ? kPrimaryColor : kGrey300Color,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Center(
            child: FBoldText("Next", kWhiteBackGroundColor, 15),
          ),
        ),
      ),
    );
  }
}
