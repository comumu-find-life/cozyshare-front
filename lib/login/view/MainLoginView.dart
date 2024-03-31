import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../api/LoginApi.dart';
import '../controller/MainLoginController.dart';
import '../widgets/LoginButtonWidget.dart';
import '../widgets/LoginFormWidget.dart';
import '../widgets/MainLoginTextWidget.dart';

class MainLoginView extends StatelessWidget {
  const MainLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginApi api = LoginApi();
    MainLoginController controller = MainLoginController();
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MainLoginTextWidget(),
            LoginFormWidget(),
            LoginButtonWidget(controller),

          ],
        ),
      ),
    );
  }

  Widget _buildStartGetter() {
    return Container(
      width: 350.w,
      height: 130.h,
      decoration: BoxDecoration(
        color: kGrey200Color
      ),
      child: Center(
        child: Body2Text("Getter로 시작하기", kTextBlackColor),
      ),
    );
  }

  Widget _buildStartProvider() {
    return Container();
  }

  Widget _buildMainText() {
    return Container();
}

}

