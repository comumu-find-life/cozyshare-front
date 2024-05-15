

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../constants/Fonts.dart';
import '../controller/ProfileDetailController.dart';
import '../widgets/ProfileDetailBody.dart';
import '../widgets/ProfileDetailHeader.dart';

class ProfileDetailView extends StatelessWidget {
  const ProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileDetailController _controller = ProfileDetailController();
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ProfileDetailBody(),
                ProfileDetailHeader(),


              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context){
    return  AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kDarkBlue,
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

                  child: Icon(Icons.arrow_back_ios, color: kWhiteBackGroundColor,)),
            ),

            Container()
          ],
        ),
      ),
    );
  }
}
