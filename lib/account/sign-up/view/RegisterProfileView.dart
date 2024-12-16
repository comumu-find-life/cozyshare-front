

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/user/enums/SignupType.dart';

import '../../../constants/Fonts.dart';
import '../controller/SignupController.dart';
import '../widgets/UserDetailForm.dart';

class RegisterProfileView extends StatelessWidget {
  String email;
  SignupType signupType;
  RegisterProfileView(this.email, this.signupType);

  SignupController _controller = SignupController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserDetailForm(_controller),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(){
    return Obx(() => InkWell(
      onTap: (){
        _controller.checkDetail? _controller.signupOAuthAccount(signupType, email) : print("object");
      },
      child: Container(
        width: 330.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: _controller.checkDetail? kPrimaryColor : kGrey300Color),
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: _controller.checkDetail? kPrimaryColor : kGrey200Color
        ),
        child: Center(
          child: Body2Text("Register",  kWhiteColor ),
        ),
      ),
    ));
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                //여기에 코드 구현
                Navigator.pop(context);
              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Icon(Icons.arrow_back_ios)),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 0.h, right: 0.w),
                    child: Title3Text("Register Profile", kWhiteColor))),
            Container()
          ],
        ),
      ),
    );

  }
}
