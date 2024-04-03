import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/register-home/controller/RegisterHomeController.dart';
import 'package:home_and_job/my-profile/register-home/widgets/RegisterAddressWidget.dart';
import 'package:home_and_job/my-profile/register-home/widgets/RegisterHomeImageWidget.dart';

class RegisterHomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    RegisterHomeController _controller = RegisterHomeController();

    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: "",
        color: kWhiteBackGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterHomeImageWidget(_controller),
            RegisterAddressWidget(_controller)
          ],
        ),
      ),
    );
  }
}
