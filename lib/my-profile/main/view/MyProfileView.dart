import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/my-profile/main/widgets/SettingListWidget.dart';
import 'package:home_and_job/my-profile/main/widgets/ProfileWidget.dart';

import '../../../constants/Fonts.dart';
import '../controller/MyProfileController.dart';

class MyProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProfileController controller = MyProfileController();

    return Scaffold(
        backgroundColor: Colors.grey.shade100,

        body: FutureBuilder(future: controller.loadUserProfile(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Container(
          child: Body2Text("Network Error", kTextBlackColor),
        );
      } else {
        return   SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileWidget(controller),

              SettingListWidget(controller),
              Center(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40.h, bottom: 40.h),
                        child: Body2Text("@copyright comumu", kGrey400Color),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
        },));
  }



  Widget _buildAppBar() {
    return Container(
      width: 380.w,
      color: kGrey100Color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20.w, top: 30.h),
              child: Icon(
                Icons.settings,
                size: 20.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}


