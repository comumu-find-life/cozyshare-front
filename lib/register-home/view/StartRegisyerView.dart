import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/register-home/register-image/view/RegisterHomeImageView.dart';

import '../../common-widgets/button/ButtonWidgets.dart';

class StartRegisterView extends StatelessWidget {
  const StartRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet:_buildButton(),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Container(
                //   width: 60.w,
                //   height: 60.h,
                //   child: Image.asset("assets/icons/post_icon.png", fit: BoxFit.fitHeight,),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: FBoldText("Start to register your room", kTextBlackColor, 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 10.h),
                    child: FBoldText("with Find Life", kPrimaryColor, 18),
                  ),
                ],),

              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 20.h, left: 20.w),
              child: Body2Text("The listed property will be displayed for 30 days.", kGrey400Color),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20.w, top: 40.h),
                width: 230.w,
                height: 230.h,
                child: Image.asset("assets/images/common/home-post.png", fit: BoxFit.fitHeight,),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 400.h),
                width: 340.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(6))
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kWhiteBackGroundColor,
      automaticallyImplyLeading: false,
      title:  Container(
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
                  child: Icon(Icons.close)),
            ),

            Container()
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return InkWell(
      onTap: (){
        Get.to(() => RegisterHomeImageView(), transition: Transition.fade);
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child:
          NextButtonWidget("Start to register room")

      ),
    );
  }
}
